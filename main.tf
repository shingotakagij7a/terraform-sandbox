resource "local_file" "hello" {
  filename        = "output/hello.txt"
  content         = "Hello, World!"
  file_permission = "0644"
}

resource "local_sensitive_file" "sensitive_hello" {
  content         = "Hello, Sensitive World!"
  filename        = "output/sensitive_hello.txt"
  file_permission = "0644"
}
