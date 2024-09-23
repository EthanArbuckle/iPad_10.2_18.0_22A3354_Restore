@implementation UIAsyncDragInteraction

uint64_t __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "BOOLValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke_2()
{
  return MEMORY[0x1E0C9AAA0];
}

uint64_t __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithInput:", MEMORY[0x1E0C9AAB0]);
}

uint64_t __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_2()
{
  return MEMORY[0x1E0C9AA60];
}

uint64_t __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithInput:", a2);
}

@end
