@implementation PKSandboxProvider

- (int64_t)sandbox_extension_consume:(const char *)a3
{
  return sandbox_extension_consume();
}

- (int)sandbox_extension_release:(int64_t)a3
{
  return sandbox_extension_release();
}

- (int)sandbox_container_path_for_pid:(int)a3 buffer:(char *)a4 bufsize:(unint64_t)a5
{
  return sandbox_container_path_for_pid();
}

- (char)sandbox_extension_issue_file:(const char *)a3 path:(const char *)a4 flags:(unsigned int)a5
{
  return (char *)sandbox_extension_issue_file();
}

@end
