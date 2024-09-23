@implementation UIPencilPreferences

void __41___UIPencilPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1203;
  _MergedGlobals_1203 = (uint64_t)v1;

}

void __52___UIPencilPreferences__preferredTapActionDidChange__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("preferredTapAction"));
    WeakRetained[1] = _UIPencilPreferredActionForKey(CFSTR("UIPencilPreferredTapAction"));
    objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("preferredTapAction"));
  }

}

uint64_t __52___UIPencilPreferences__preferredTapActionDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56___UIPencilPreferences__preferredSqueezeActionDidChange__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("_preferredSqueezeAction"));
    WeakRetained[2] = _UIPencilPreferredActionForKey(CFSTR("UIPencilPreferredSqueezeAction"));
    objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("_preferredSqueezeAction"));
  }

}

uint64_t __56___UIPencilPreferences__preferredSqueezeActionDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58___UIPencilPreferences__prefersPencilOnlyDrawingDidChange__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("prefersPencilOnlyDrawing"));
    WeakRetained[24] = WeakRetained[24] & 0xFE | _UIPencilPrefersPencilOnlyDrawingForKey();
    objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("prefersPencilOnlyDrawing"));
  }

}

uint64_t __58___UIPencilPreferences__prefersPencilOnlyDrawingDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57___UIPencilPreferences__prefersHoverToolPreviewDidChange__block_invoke(uint64_t a1)
{
  char v1;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "willChangeValueForKey:", CFSTR("prefersHoverToolPreview"));
    if (_UIPencilPrefersHoverToolPreview())
      v1 = 2;
    else
      v1 = 0;
    WeakRetained[24] = WeakRetained[24] & 0xFD | v1;
    objc_msgSend((id)objc_opt_class(), "didChangeValueForKey:", CFSTR("prefersHoverToolPreview"));
  }

}

uint64_t __57___UIPencilPreferences__prefersHoverToolPreviewDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
