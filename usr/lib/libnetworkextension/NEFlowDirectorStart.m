@implementation NEFlowDirectorStart

void __NEFlowDirectorStart_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    flow_director_ctl_source_do_read();
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

@end
