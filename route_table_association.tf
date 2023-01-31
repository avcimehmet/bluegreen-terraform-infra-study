resource "aws_route_table_association" "Blue-green-deployment" {
  count          = 3
  subnet_id      = element(local.subnets, count.index)
  route_table_id = aws_route_table.Blue-green-deployment.id
}