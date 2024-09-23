@implementation QWORD))

uint64_t __task_enumerate_malloc_blocks_block_invoke(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), _QWORD))
{
  return (*a3)(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 52), a2, task_peek_natural_size, *(_QWORD *)(a1 + 40));
}

@end
