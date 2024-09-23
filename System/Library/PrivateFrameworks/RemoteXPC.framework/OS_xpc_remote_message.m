@implementation OS_xpc_remote_message

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->link_stqe_next, 0);
  for (i = 160; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->body, 0);
  objc_storeStrong(&self->barrier, 0);
}

@end
