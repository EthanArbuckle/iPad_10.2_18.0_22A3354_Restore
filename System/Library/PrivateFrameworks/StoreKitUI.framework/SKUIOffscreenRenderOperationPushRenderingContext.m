@implementation SKUIOffscreenRenderOperationPushRenderingContext

unint64_t ___SKUIOffscreenRenderOperationPushRenderingContext_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t result;

  v2 = (void *)sRendererStackArray;
  if (!sRendererStackArray)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v4 = (void *)sRendererStackArray;
    sRendererStackArray = v3;

    v2 = (void *)sRendererStackArray;
  }
  result = objc_msgSend(v2, "count");
  if (result <= 5)
  {
    objc_msgSend((id)sRendererStackArray, "addObject:", *(_QWORD *)(a1 + 32));
    return objc_msgSend((id)sRendererStackArray, "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

@end
