@implementation UIPointerInteractionPencilHoverDriver

void __52___UIPointerInteractionPencilHoverDriver_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  unint64_t v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 24))
    {
      *((_BYTE *)WeakRetained + 24) = 0;
      v3 = WeakRetained;
      v2 = objc_msgSend(*((id *)WeakRetained + 2), "state") - 1;
      WeakRetained = v3;
      if (v2 <= 1)
      {
        objc_msgSend(v3, "_updateHover:forced:", v3[2], 1);
        WeakRetained = v3;
      }
    }
  }

}

@end
