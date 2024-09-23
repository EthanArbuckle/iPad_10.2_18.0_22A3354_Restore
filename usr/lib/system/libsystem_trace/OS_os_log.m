@implementation OS_os_log

- (void)dealloc
{
  qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: os log handles are never freed";
  __break(1u);
}

@end
