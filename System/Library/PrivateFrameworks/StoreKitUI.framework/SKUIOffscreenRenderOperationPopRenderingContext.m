@implementation SKUIOffscreenRenderOperationPopRenderingContext

unint64_t ___SKUIOffscreenRenderOperationPopRenderingContext_block_invoke(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  result = objc_msgSend((id)sRendererStackArray, "count");
  if (result >= 2)
  {
    objc_msgSend((id)sRendererStackArray, "objectAtIndex:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend((id)sRendererStackArray, "objectAtIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    return objc_msgSend((id)sRendererStackArray, "removeObjectsInRange:", 0, 2);
  }
  return result;
}

@end
