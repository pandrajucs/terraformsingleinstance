#Generate Ransom values
resource "random_integer" "priority" {
  count = 6
  min   = 500
  max   = 10000
}

resource "aws_s3_bucket" "s3buckets" {
  count = 6
  #Create bucket name by picking up random value using splat syntax and random function
  bucket = format("s3bucket%s", element(random_integer.priority.*.result, count.index))

  tags = {
    Name        = format("s3bucket%s", element(random_integer.priority.*.result, count.index))
    Environment = var.environment
  }
}
