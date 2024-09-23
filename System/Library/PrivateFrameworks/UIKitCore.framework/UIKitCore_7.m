void sub_1864E6A3C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 192));
  _Unwind_Resume(a1);
}

void sub_1864E7ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1864E80D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getFPItemManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPItemManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_9_14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFPItemManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIDocumentSharingController.m"), 50, CFSTR("Unable to find class %s"), "FPItemManager");

    __break(1u);
  }
}

void FileProviderLibrary_1()
{
  void *v0;
  void *v1;
  void *v2;

  if (!FileProviderLibraryCore_frameworkLibrary_0)
    FileProviderLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!FileProviderLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FileProviderLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIDocumentSharingController.m"), 47, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getFPSandboxingURLWrapperClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPSandboxingURLWrapper");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ECD7AE50 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFPSandboxingURLWrapperClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIDocumentSharingController.m"), 48, CFSTR("Unable to find class %s"), "FPSandboxingURLWrapper");

    __break(1u);
  }
}

void _UIFocusRotaryRingConfigureShadowForLayer(void *a1)
{
  int v1;
  double v2;
  id v3;
  int v4;
  double v5;
  int v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a1;
  v1 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76BC8, (uint64_t)CFSTR("RotaryFocusRingShadowColor"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v2 = *(double *)&qword_1ECD76BD0;
  if (v1)
    v2 = 0.0;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v2, 1.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setShadowColor:", objc_msgSend(v3, "CGColor"));

  v4 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76BD8, (uint64_t)CFSTR("RotaryFocusRingShadowOpacity"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  HIDWORD(v5) = HIDWORD(qword_1ECD76BE0);
  *(float *)&v5 = *(double *)&qword_1ECD76BE0;
  if (v4)
    *(float *)&v5 = 0.8;
  objc_msgSend(v10, "setShadowOpacity:", v5);
  v6 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76BE8, (uint64_t)CFSTR("RotaryFocusRingShadowRadius"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v7 = *(double *)&qword_1ECD76BF0;
  if (v6)
    v7 = 4.0;
  objc_msgSend(v10, "setShadowRadius:", v7);
  if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76BF8, (uint64_t)CFSTR("RotaryFocusRingShadowOffset"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v8 = 0.0;
  else
    v8 = *(double *)&qword_1ECD76C00;
  if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76BF8, (uint64_t)CFSTR("RotaryFocusRingShadowOffset"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v9 = 0.0;
  else
    v9 = *(double *)&qword_1ECD76C00;
  objc_msgSend(v10, "setShadowOffset:", v8, v9);

}

void sub_1864EB1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCKOperationProgressCallbackClassesSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!qword_1ECD82A50)
    qword_1ECD82A50 = _sl_dlopen();
  v2 = (void *)qword_1ECD82A50;
  if (!qword_1ECD82A50)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("_UIShareInvitationRemoteViewController.m"), 32, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "CKOperationProgressCallbackClasses");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  _MergedGlobals_1341 = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

id MakeConversionHandler(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __MakeConversionHandler_block_invoke;
  aBlock[3] = &unk_1E16E4EB0;
  v6 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

void SendUpdatesToEditResponder(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  MakeConversionHandler(a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTextAttributesWithConversionHandler:", v4);

}

void sub_1864EC298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1864ECFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_1864EE100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1864EE278(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1864EE5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1864EE7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1864F1AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _UIClickPresentationBackgroundEffects(int a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;

  if (a1
    && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v2 = objc_msgSend(v1, "userInterfaceIdiom"),
        v1,
        !v2))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_AXSReduceMotionEnabled() && !_AXSEnhanceBackgroundContrastEnabled())
    {
      +[_UIZoomEffect zoomEffectWithMagnitude:](_UIZoomEffect, "zoomEffectWithMagnitude:", 0.024);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id _UIClickPresentationBackgroundColor(int a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  int v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (a1)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "userInterfaceIdiom");

    switch(v2)
    {
      case 1:
        +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
      case 8:
        if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_920, (uint64_t)CFSTR("TVContextMenu_BackgroundDimWhite")))v3 = 0.0;
        else
          v3 = *(double *)&qword_1ECD76C10;
        v4 = _UIInternalPreferenceUsesDefault_1((int *)algn_1ECD76C18, (uint64_t)CFSTR("TVContextMenu_BackgroundDimAlpha"));
        v5 = 0.45;
        if (!v4)
          v5 = *(double *)&qword_1ECD76C20;
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        +[UIColor clearColor](UIColor, "clearColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v7 = 0.0862745098;
        v8 = 0.0823529412;
        v9 = 0.164705882;
        v10 = 0.21;
        goto LABEL_10;
    }
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
LABEL_10:
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t IsGelatoEnabled()
{
  int v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;

  v0 = _os_feature_enabled_impl();
  _UIKitUserDefaults();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_NSSharingServiceGelatoEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _UIKitUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("_NSSharingServiceGelatoEnabled"));

  }
  else
  {
    v4 = 1;
  }

  return v0 & v4;
}

const __CFString *CloudSharingUIExtensionBundleID()
{
  return CFSTR("com.apple.CloudSharingUI.CloudSharing");
}

id _UITextFormattingViewControllerEmphasisStyleClasses()
{
  if (qword_1ECD82A60 != -1)
    dispatch_once(&qword_1ECD82A60, &__block_literal_global_692);
  return (id)_MergedGlobals_1342;
}

void sub_1864F3710(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1864F53B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1864F6F94(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1864F70D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1864F72D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1864FA88C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FAB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1864FABB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1864FACC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FAD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1864FB23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  void *v18;

  if (v17)
    operator delete(v17);

  _Unwind_Resume(a1);
}

void sub_1864FB3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1864FB4F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1864FB5BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FB744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FB7F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1864FB9F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FBA64()
{
  JUMPOUT(0x1864FBA50);
}

void sub_1864FBA70()
{
  JUMPOUT(0x1864FBA54);
}

void sub_1864FBB8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FBF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1864FC108(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FC2A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FC5A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1864FC6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1864FC9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;

  if (__p)
    operator delete(__p);

  if (v11)
    operator delete(v11);
  _Unwind_Resume(a1);
}

void sub_1864FCA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FCB40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1864FCF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a1);
}

_UIWindowScenePreservedPlacement *_UIWindowScenePlacementForLegacyFlags(uint64_t a1, int a2, int a3, uint64_t a4)
{
  int v6;
  _UIWindowScenePreservedPlacement *v7;
  __objc2_class *v8;
  _UIWindowScenePreservedPlacement *v9;

  v6 = a1 | a2 | a3;
  if ((v6 & 1) == 0 && (a4 & 1) == 0)
  {
    +[UIWindowSceneStandardPlacement standardPlacement](UIWindowSceneStandardPlacement, "standardPlacement");
    v7 = (_UIWindowScenePreservedPlacement *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v9 = v7;
    return v9;
  }
  if ((_DWORD)a1 && (a2 & 1) == 0 && (a3 & 1) == 0 && (a4 & 1) == 0)
  {
    v8 = _UIWindowSceneFullscreenPlacement;
LABEL_15:
    v7 = (_UIWindowScenePreservedPlacement *)objc_alloc_init(v8);
    goto LABEL_16;
  }
  if (((v6 | a4 ^ 1) & 1) == 0)
  {
    v8 = _UIWindowSceneBackgroundPlacement;
    goto LABEL_15;
  }
  if (!a2 || (a3 & 1) != 0 || (a4 & 1) != 0)
  {
    if (((a1 | a2 | a3 ^ 1) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v9 = objc_alloc_init(_UIWindowScenePreservedPlacement);
      -[_UIWindowScenePreservedPlacement setKeepInBackground:](v9, "setKeepInBackground:", a4);
    }
  }
  else
  {
    +[UIWindowSceneProminentPlacement prominentPlacement](UIWindowSceneProminentPlacement, "prominentPlacement");
    v9 = (_UIWindowScenePreservedPlacement *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowScenePreservedPlacement _setPrefersLargeSize:](v9, "_setPrefersLargeSize:", a1);
  }
  return v9;
}

id _UIWindowScenePlacementForStyleAndSizeCategory(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    a3 = a1;
  if (!a3)
    return 0;
  _UIWindowScenePlacementForLegacyFlags(a2 == 1, a3 == 2, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t _UIWindowScenePresentationStyleFromPlacement(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1 && objc_msgSend((id)objc_opt_class(), "_placementType") == 2)
    v2 = 2;
  else
    v2 = 1;

  return v2;
}

BOOL _UIWindowSceneActivationRequestOptionsHaveModifiedStyleOrSize(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (objc_msgSend(v1, "preferredPresentationStyle"))
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "_preferredSizeCategory") != 0;

  return v2;
}

id _UIDatePickerStoredLocaleForLocale(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;

  v1 = a1;
  if (v1
    && (objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v1, "isEqual:", v2),
        v2,
        (v3 & 1) == 0))
  {
    v4 = v1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _UIDatePickerUserLocaleForLocale(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id _UIDatePickerStoredCalendarForCalendar(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "isEqual:", v2) & 1) != 0)
    {
LABEL_3:
      v3 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v4 = objc_msgSend(v1, "firstWeekday");
    if (v4 == objc_msgSend(v2, "firstWeekday"))
    {
      v5 = objc_msgSend(v1, "minimumDaysInFirstWeek");
      if (v5 == objc_msgSend(v2, "minimumDaysInFirstWeek"))
      {
        objc_msgSend(v1, "locale");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "locale");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isEqual:", v7))
        {
          objc_msgSend(v1, "timeZone");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "timeZone");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqual:", v9))
          {
            objc_msgSend(v1, "calendarIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "calendarIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

            if ((v12 & 1) != 0)
              goto LABEL_3;
            goto LABEL_13;
          }

        }
      }
    }
LABEL_13:
    v3 = v1;
    goto LABEL_14;
  }
  v3 = 0;
LABEL_15:

  return v3;
}

id _UIDatePickerUserCalendarForCalendar(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

void sub_186502F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _UIKitRegisterTextEffectsCatalog(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D1A6A8];
  v4 = a2;
  v5 = a1;
  v6 = objc_msgSend([v3 alloc], "initWithName:fromBundle:error:", v5, v4, 0);

  v7 = (void *)_MergedGlobals_1344;
  _MergedGlobals_1344 = v6;

}

id _UIKitGetTextEffectsCatalog()
{
  void *v0;

  v0 = (void *)_MergedGlobals_1344;
  if (!_MergedGlobals_1344)
  {
    if (qword_1ECD82A88 != -1)
      dispatch_once(&qword_1ECD82A88, &__block_literal_global_698);
    v0 = (void *)qword_1ECD82A80;
  }
  return v0;
}

void _UISharedImageSetPreferredImageScale(double a1)
{
  void *v2;

  __UIKitSharedArtworkManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredScale:", a1);

  __preferredDeviceScale = (unint64_t)a1;
}

double _UISharedImageSetPreferredTraitCollection(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double result;

  v1 = a1;
  __UIKitSharedArtworkManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredTraitCollection:", v1);

  objc_msgSend(v1, "displayScale");
  v4 = v3;

  result = rint(v4);
  __preferredDeviceScale = (uint64_t)result;
  return result;
}

id _UIPathForImageWithCacheName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("_"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subarrayWithRange:", 1, objc_msgSend(v2, "count") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("_"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _UIImageAtPath(void *a1, void *a2, char a3, int a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  id ImageAtPath;
  void *Value;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v20;
  const __CFDictionary *v21;
  uint64_t v22;

  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v7, "length"))
  {
    v9 = v7;
    v10 = v8;
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = &stru_1E16EDF20;
      if (v11)
        v12 = v11;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
    Value = (void *)__nameTable;
    if (__nameTable)
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)__nameTable, v13);
    ImageAtPath = Value;
    if ((objc_msgSend(ImageAtPath, "_isCached") & 1) == 0)
      objc_msgSend(ImageAtPath, "_setCached:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
    if (!ImageAtPath)
    {
      _UIImageCollectImagePathsForPath(v9, v10, a3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        +[UIScreen _mainScreenThreadSafeTraitCollection](UIScreen, "_mainScreenThreadSafeTraitCollection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        BestPathForTraits(v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = +[UIImage _scaleDefinedByPath:](UIImage, "_scaleDefinedByPath:", v18);
        v20 = (double)v19;
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          v20 = 1.0;
        ImageAtPath = (id)GetImageAtPath(v18, a4, v20);
        if (ImageAtPath)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
          v21 = (const __CFDictionary *)__nameTable;
          if (!__nameTable)
          {
            __nameTable = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
            __imageTable = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
            v21 = (const __CFDictionary *)__nameTable;
          }
          if (CFDictionaryContainsKey(v21, v13))
          {
            CFDictionaryGetValue((CFDictionaryRef)__nameTable, v13);
            v22 = objc_claimAutoreleasedReturnValue();

            ImageAtPath = (id)v22;
          }
          else
          {
            objc_msgSend(ImageAtPath, "_setNamed:", 1);
            objc_msgSend(ImageAtPath, "_setCached:", 1);
            CFDictionarySetValue((CFMutableDictionaryRef)__nameTable, v13, ImageAtPath);
            CFDictionarySetValue((CFMutableDictionaryRef)__imageTable, ImageAtPath, v13);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
        }

      }
      else
      {
        ImageAtPath = 0;
      }

    }
  }
  else
  {
    ImageAtPath = 0;
  }

  return ImageAtPath;
}

uint64_t _UIIsPrivateSystemSymbolImage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "_primitiveImageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__UIKitCoreGlyphsManagersLock);
    v3 = (void *)__UIKitPrivateCoreGlyphsManager;
    os_unfair_lock_unlock((os_unfair_lock_t)&__UIKitCoreGlyphsManagersLock);
    v4 = v3;
    v5 = objc_msgSend(v4, "_imageBelongsToCoreGlyphs:", v1);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void _UISharedImageFlushAll()
{
  const __CFDictionary *v0;
  CFIndex Count;
  CFMutableArrayRef Mutable;
  CFRange v3;

  if (__nameTable)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
    v0 = (const __CFDictionary *)__nameTable;
    Count = CFDictionaryGetCount((CFDictionaryRef)__nameTable);
    Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
    CFDictionaryApplyFunction(v0, (CFDictionaryApplierFunction)CopyImageValue, Mutable);
    v3.location = 0;
    v3.length = Count;
    CFArrayApplyFunction(Mutable, v3, (CFArrayApplierFunction)FlushCachedImage, 0);
    CFDictionaryRemoveAllValues((CFMutableDictionaryRef)__nameTable);
    CFDictionaryRemoveAllValues((CFMutableDictionaryRef)__imageTable);
    os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
    CFRelease(Mutable);
  }
}

void CopyImageValue(int a1, const void *a2, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, a2);
}

void FlushCachedImage(void *a1)
{
  id v1;

  v1 = a1;
  if (objc_msgSend(v1, "_isCached"))
    objc_msgSend(v1, "_setCached:", 0);

}

void UIKBLADarwinUIPresented_0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __UIKBLADarwinUIPresented_block_invoke_0;
  block[3] = &unk_1E16B1B28;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void UIKBLADarwinUIDismissed_0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __UIKBLADarwinUIDismissed_block_invoke_0;
  block[3] = &unk_1E16B1B28;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id _extendStateRestorationQueue()
{
  if (_MergedGlobals_1345 != -1)
    dispatch_once(&_MergedGlobals_1345, &__block_literal_global_17_5);
  return (id)qword_1ECD82AA8;
}

void ___extendStateRestorationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("_holdSceneEventResponsesQueue", 0);
  v1 = (void *)qword_1ECD82AA8;
  qword_1ECD82AA8 = (uint64_t)v0;

}

void _unsupportedDestinationType(CFTypeID a1)
{
  __CFString *v2;

  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v2 = (__CFString *)CFCopyTypeIDDescription(a1);
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

void _UIViewLogForNotInHierarchyViewHitTestResult(void *a1, void *a2, void *a3)
{
  unint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = _UIViewLogForNotInHierarchyViewHitTestResult___s_category;
  if (!_UIViewLogForNotInHierarchyViewHitTestResult___s_category)
  {
    v6 = __UILogCategoryGetNode("View", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_UIViewLogForNotInHierarchyViewHitTestResult___s_category);
  }
  v7 = *(id *)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (a1)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = a1;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = CFSTR("(nil)");
    }
    v13 = v12;
    if (a2)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = a2;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v15);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = CFSTR("(nil)");
    }
    v19 = v18;
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = a3;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v23, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138543874;
    v26 = v13;
    v27 = 2114;
    v28 = v19;
    v29 = 2114;
    v30 = v24;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Invalid returned hit test result for view in hierarchy: The returned hit test result is invalid and may cause issues as it is not in a window hierarchy: self: %{public}@; hit-tested subview: %{public}@; invalid returned view: %{public}@",
      buf,
      0x20u);

  }
}

uint64_t sub_1865067FC()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_186506808()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_186506814()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_186506820()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_18650682C()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_186506838()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_186506844()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_186506850()
{
  return MEMORY[0x1E0CAE920]();
}

uint64_t sub_18650685C()
{
  return MEMORY[0x1E0CAE928]();
}

uint64_t sub_186506868()
{
  return MEMORY[0x1E0CAEE20]();
}

uint64_t sub_186506874()
{
  return MEMORY[0x1E0C8ED10]();
}

uint64_t sub_186506880()
{
  return MEMORY[0x1E0DC1480]();
}

uint64_t sub_18650688C()
{
  return MEMORY[0x1E0CAEEE0]();
}

uint64_t sub_186506898()
{
  return MEMORY[0x1E0CAEF10]();
}

uint64_t sub_1865068A4()
{
  return MEMORY[0x1E0CAEF48]();
}

uint64_t sub_1865068B0()
{
  return MEMORY[0x1E0CAF010]();
}

uint64_t sub_1865068BC()
{
  return MEMORY[0x1E0CAF128]();
}

uint64_t sub_1865068C8()
{
  return MEMORY[0x1E0CAF138]();
}

uint64_t sub_1865068D4()
{
  return MEMORY[0x1E0CAF150]();
}

uint64_t sub_1865068E0()
{
  return MEMORY[0x1E0CAF160]();
}

uint64_t sub_1865068EC()
{
  return MEMORY[0x1E0CA7928]();
}

uint64_t sub_1865068F8()
{
  return MEMORY[0x1E0CA7930]();
}

uint64_t sub_186506904()
{
  return MEMORY[0x1E0CAF238]();
}

uint64_t sub_186506910()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_18650691C()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_186506928()
{
  return MEMORY[0x1E0CAF280]();
}

uint64_t sub_186506934()
{
  return MEMORY[0x1E0CAF290]();
}

uint64_t sub_186506940()
{
  return MEMORY[0x1E0CAF298]();
}

uint64_t sub_18650694C()
{
  return MEMORY[0x1E0CAF2B8]();
}

uint64_t sub_186506958()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_186506964()
{
  return MEMORY[0x1E0CAF330]();
}

uint64_t sub_186506970()
{
  return MEMORY[0x1E0CAF410]();
}

uint64_t sub_18650697C()
{
  return MEMORY[0x1E0CAF418]();
}

uint64_t sub_186506988()
{
  return MEMORY[0x1E0CAF428]();
}

uint64_t sub_186506994()
{
  return MEMORY[0x1E0CAF438]();
}

uint64_t sub_1865069A0()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_1865069AC()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1865069B8()
{
  return MEMORY[0x1E0CAF470]();
}

uint64_t sub_1865069C4()
{
  return MEMORY[0x1E0CAF478]();
}

uint64_t sub_1865069D0()
{
  return MEMORY[0x1E0CAF480]();
}

uint64_t sub_1865069DC()
{
  return MEMORY[0x1E0CAF558]();
}

uint64_t sub_1865069E8()
{
  return MEMORY[0x1E0CAF560]();
}

uint64_t sub_1865069F4()
{
  return MEMORY[0x1E0CAF568]();
}

uint64_t sub_186506A00()
{
  return MEMORY[0x1E0CAF578]();
}

uint64_t sub_186506A0C()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_186506A18()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_186506A24()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_186506A30()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_186506A3C()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_186506A48()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_186506A54()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_186506A60()
{
  return MEMORY[0x1E0DC1488]();
}

uint64_t sub_186506A6C()
{
  return MEMORY[0x1E0CAF970]();
}

uint64_t sub_186506A78()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_186506A84()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_186506A90()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_186506A9C()
{
  return MEMORY[0x1E0CAF9E0]();
}

uint64_t sub_186506AA8()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_186506AB4()
{
  return MEMORY[0x1E0CAFA30]();
}

uint64_t sub_186506AC0()
{
  return MEMORY[0x1E0CAFA38]();
}

uint64_t sub_186506ACC()
{
  return MEMORY[0x1E0CAFB20]();
}

uint64_t sub_186506AD8()
{
  return MEMORY[0x1E0CAFC20]();
}

uint64_t sub_186506AE4()
{
  return MEMORY[0x1E0CAFC28]();
}

uint64_t sub_186506AF0()
{
  return MEMORY[0x1E0CAFC30]();
}

uint64_t sub_186506AFC()
{
  return MEMORY[0x1E0CAFC38]();
}

uint64_t sub_186506B08()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_186506B14()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_186506B20()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_186506B2C()
{
  return MEMORY[0x1E0CB0068]();
}

uint64_t sub_186506B38()
{
  return MEMORY[0x1E0CB0070]();
}

uint64_t sub_186506B44()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_186506B50()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_186506B5C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_186506B68()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_186506B74()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_186506B80()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_186506B8C()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t _s5UIKit16UITextEffectViewC0C2IDV2eeoiySbAE_AEtFZ_0()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_186506BA4()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_186506BB0()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_186506BBC()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_186506BC8()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_186506BD4()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_186506BE0()
{
  return MEMORY[0x1E0CB0D68]();
}

uint64_t sub_186506BEC()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_186506BF8()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_186506C04()
{
  return MEMORY[0x1E0CB12A8]();
}

uint64_t sub_186506C10()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_186506C1C()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_186506C28()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_186506C34()
{
  return MEMORY[0x1E0CB1610]();
}

uint64_t sub_186506C40()
{
  return MEMORY[0x1E0CB1628]();
}

uint64_t sub_186506C4C()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_186506C58()
{
  return MEMORY[0x1E0CB16A0]();
}

uint64_t sub_186506C64()
{
  return MEMORY[0x1E0CB16A8]();
}

uint64_t sub_186506C70()
{
  return MEMORY[0x1E0CB16C8]();
}

uint64_t sub_186506C7C()
{
  return MEMORY[0x1E0DEFD20]();
}

uint64_t sub_186506C88()
{
  return MEMORY[0x1E0DEFD28]();
}

uint64_t sub_186506C94()
{
  return MEMORY[0x1E0DEFD38]();
}

uint64_t sub_186506CA0()
{
  return MEMORY[0x1E0DEFD40]();
}

uint64_t sub_186506CAC()
{
  return MEMORY[0x1E0DEFD50]();
}

uint64_t sub_186506CB8()
{
  return MEMORY[0x1E0C9B8A8]();
}

uint64_t sub_186506CC4()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_186506CD0()
{
  return MEMORY[0x1E0CB1720]();
}

uint64_t sub_186506CDC()
{
  return MEMORY[0x1E0CB1728]();
}

uint64_t sub_186506CE8()
{
  return MEMORY[0x1E0CB1738]();
}

uint64_t sub_186506CF4()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_186506D00()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_186506D0C()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_186506D18()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t sub_186506D24()
{
  return MEMORY[0x1E0DF1F28]();
}

uint64_t sub_186506D30()
{
  return MEMORY[0x1E0CA9BB0]();
}

uint64_t sub_186506D3C()
{
  return MEMORY[0x1E0CA9BB8]();
}

uint64_t sub_186506D48()
{
  return MEMORY[0x1E0CA9BC0]();
}

uint64_t sub_186506D54()
{
  return MEMORY[0x1E0CA9BC8]();
}

uint64_t sub_186506D60()
{
  return MEMORY[0x1E0CA9BD0]();
}

uint64_t sub_186506D6C()
{
  return MEMORY[0x1E0CA9BE0]();
}

uint64_t sub_186506D78()
{
  return MEMORY[0x1E0CA9BF0]();
}

uint64_t sub_186506D84()
{
  return MEMORY[0x1E0CA9BF8]();
}

uint64_t sub_186506D90()
{
  return MEMORY[0x1E0CA9C00]();
}

uint64_t sub_186506D9C()
{
  return MEMORY[0x1E0CA9C20]();
}

uint64_t sub_186506DA8()
{
  return MEMORY[0x1E0CA9C28]();
}

uint64_t sub_186506DB4()
{
  return MEMORY[0x1E0CA9C30]();
}

uint64_t sub_186506DC0()
{
  return MEMORY[0x1E0CA9C38]();
}

uint64_t sub_186506DCC()
{
  return MEMORY[0x1E0CA9C50]();
}

uint64_t sub_186506DD8()
{
  return MEMORY[0x1E0CA9C58]();
}

uint64_t sub_186506DE4()
{
  return MEMORY[0x1E0CA9C60]();
}

uint64_t sub_186506DF0()
{
  return MEMORY[0x1E0CA9C68]();
}

uint64_t sub_186506DFC()
{
  return MEMORY[0x1E0CA9C78]();
}

uint64_t sub_186506E08()
{
  return MEMORY[0x1E0DC1490]();
}

uint64_t sub_186506E14()
{
  return MEMORY[0x1E0DC1498]();
}

uint64_t sub_186506E20()
{
  return MEMORY[0x1E0DC14A0]();
}

uint64_t sub_186506E2C()
{
  return MEMORY[0x1E0DC14B0]();
}

uint64_t sub_186506E38()
{
  return MEMORY[0x1E0DC14B8]();
}

uint64_t sub_186506E44()
{
  return MEMORY[0x1E0DC14C0]();
}

uint64_t sub_186506E50()
{
  return MEMORY[0x1E0DC14C8]();
}

uint64_t sub_186506E5C()
{
  return MEMORY[0x1E0DC14D0]();
}

uint64_t sub_186506E68()
{
  return MEMORY[0x1E0DC14D8]();
}

uint64_t sub_186506E74()
{
  return MEMORY[0x1E0DC14E0]();
}

uint64_t sub_186506E80()
{
  return MEMORY[0x1E0DC14E8]();
}

uint64_t sub_186506E8C()
{
  return MEMORY[0x1E0DC14F0]();
}

uint64_t sub_186506E98()
{
  return MEMORY[0x1E0DC14F8]();
}

uint64_t sub_186506EA4()
{
  return MEMORY[0x1E0DC1518]();
}

uint64_t sub_186506EB0()
{
  return MEMORY[0x1E0DC1520]();
}

uint64_t sub_186506EBC()
{
  return MEMORY[0x1E0DC1528]();
}

uint64_t sub_186506EC8()
{
  return MEMORY[0x1E0DC1530]();
}

uint64_t sub_186506ED4()
{
  return MEMORY[0x1E0DC1538]();
}

uint64_t sub_186506EE0()
{
  return MEMORY[0x1E0DC1548]();
}

uint64_t sub_186506EEC()
{
  return MEMORY[0x1E0DC1550]();
}

uint64_t sub_186506EF8()
{
  return MEMORY[0x1E0DC1558]();
}

uint64_t sub_186506F04()
{
  return MEMORY[0x1E0DC1560]();
}

uint64_t sub_186506F10()
{
  return MEMORY[0x1E0DC1568]();
}

uint64_t sub_186506F1C()
{
  return MEMORY[0x1E0DC1570]();
}

uint64_t sub_186506F28()
{
  return MEMORY[0x1E0DC1580]();
}

uint64_t sub_186506F34()
{
  return MEMORY[0x1E0DC1590]();
}

uint64_t sub_186506F40()
{
  return MEMORY[0x1E0DC15A0]();
}

uint64_t sub_186506F4C()
{
  return MEMORY[0x1E0DC15B0]();
}

uint64_t sub_186506F58()
{
  return MEMORY[0x1E0DC15B8]();
}

uint64_t sub_186506F64()
{
  return MEMORY[0x1E0DC15C8]();
}

uint64_t sub_186506F70()
{
  return MEMORY[0x1E0DC15D0]();
}

uint64_t sub_186506F7C()
{
  return MEMORY[0x1E0DC1610]();
}

uint64_t sub_186506F88()
{
  return MEMORY[0x1E0DC1618]();
}

uint64_t sub_186506F94()
{
  return MEMORY[0x1E0DC1620]();
}

uint64_t sub_186506FA0()
{
  return MEMORY[0x1E0DC1630]();
}

uint64_t sub_186506FAC()
{
  return MEMORY[0x1E0DC1638]();
}

uint64_t sub_186506FB8()
{
  return MEMORY[0x1E0DC1648]();
}

uint64_t sub_186506FC4()
{
  return MEMORY[0x1E0DC1650]();
}

uint64_t sub_186506FD0()
{
  return MEMORY[0x1E0DC1668]();
}

uint64_t sub_186506FDC()
{
  return MEMORY[0x1E0DC1680]();
}

uint64_t sub_186506FE8()
{
  return MEMORY[0x1E0DC1688]();
}

uint64_t sub_186506FF4()
{
  return MEMORY[0x1E0DC1690]();
}

uint64_t sub_186507000()
{
  return MEMORY[0x1E0DC1698]();
}

uint64_t sub_18650700C()
{
  return MEMORY[0x1E0DC16A0]();
}

uint64_t sub_186507018()
{
  return MEMORY[0x1E0DC16A8]();
}

uint64_t sub_186507024()
{
  return MEMORY[0x1E0DC16E0]();
}

uint64_t sub_186507030()
{
  return MEMORY[0x1E0DC16F0]();
}

uint64_t sub_18650703C()
{
  return MEMORY[0x1E0DC1708]();
}

uint64_t sub_186507048()
{
  return MEMORY[0x1E0DC1710]();
}

uint64_t sub_186507054()
{
  return MEMORY[0x1E0DC1718]();
}

uint64_t sub_186507060()
{
  return MEMORY[0x1E0DC1720]();
}

uint64_t sub_18650706C()
{
  return MEMORY[0x1E0DC1730]();
}

uint64_t sub_186507078()
{
  return MEMORY[0x1E0DC1738]();
}

uint64_t sub_186507084()
{
  return MEMORY[0x1E0DC1740]();
}

uint64_t sub_186507090()
{
  return MEMORY[0x1E0DC1748]();
}

uint64_t sub_18650709C()
{
  return MEMORY[0x1E0DC1750]();
}

uint64_t sub_1865070A8()
{
  return MEMORY[0x1E0DC1758]();
}

uint64_t sub_1865070B4()
{
  return MEMORY[0x1E0DC1760]();
}

uint64_t sub_1865070C0()
{
  return MEMORY[0x1E0DC1770]();
}

uint64_t sub_1865070CC()
{
  return MEMORY[0x1E0DC1778]();
}

uint64_t sub_1865070D8()
{
  return MEMORY[0x1E0DC1780]();
}

uint64_t sub_1865070E4()
{
  return MEMORY[0x1E0DC1788]();
}

uint64_t sub_1865070F0()
{
  return MEMORY[0x1E0DC1790]();
}

uint64_t sub_1865070FC()
{
  return MEMORY[0x1E0DC1798]();
}

uint64_t sub_186507108()
{
  return MEMORY[0x1E0DC17A0]();
}

uint64_t sub_186507114()
{
  return MEMORY[0x1E0DC17A8]();
}

uint64_t sub_186507120()
{
  return MEMORY[0x1E0DC17B0]();
}

uint64_t sub_18650712C()
{
  return MEMORY[0x1E0DC17B8]();
}

uint64_t sub_186507138()
{
  return MEMORY[0x1E0DC17C0]();
}

uint64_t sub_186507144()
{
  return MEMORY[0x1E0DC17C8]();
}

uint64_t sub_186507150()
{
  return MEMORY[0x1E0DC17D0]();
}

uint64_t sub_18650715C()
{
  return MEMORY[0x1E0DC17D8]();
}

uint64_t sub_186507168()
{
  return MEMORY[0x1E0DC17E0]();
}

uint64_t sub_186507174()
{
  return MEMORY[0x1E0DC17E8]();
}

uint64_t sub_186507180()
{
  return MEMORY[0x1E0DC17F0]();
}

uint64_t sub_18650718C()
{
  return MEMORY[0x1E0DC17F8]();
}

uint64_t sub_186507198()
{
  return MEMORY[0x1E0DC1800]();
}

uint64_t sub_1865071A4()
{
  return MEMORY[0x1E0DC1810]();
}

uint64_t sub_1865071B0()
{
  return MEMORY[0x1E0DC1818]();
}

uint64_t sub_1865071BC()
{
  return MEMORY[0x1E0DC1820]();
}

uint64_t sub_1865071C8()
{
  return MEMORY[0x1E0DC1828]();
}

uint64_t sub_1865071D4()
{
  return MEMORY[0x1E0DC1830]();
}

uint64_t sub_1865071E0()
{
  return MEMORY[0x1E0DC1840]();
}

uint64_t sub_1865071EC()
{
  return MEMORY[0x1E0DC1848]();
}

uint64_t sub_1865071F8()
{
  return MEMORY[0x1E0DF20F8]();
}

uint64_t sub_186507204()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_186507210()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_18650721C()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_186507228()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_186507234()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_186507240()
{
  return MEMORY[0x1E0DF2210]();
}

uint64_t sub_18650724C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_186507258()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_186507264()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_186507270()
{
  return MEMORY[0x1E0CE3470]();
}

uint64_t sub_18650727C()
{
  return MEMORY[0x1E0CE3478]();
}

uint64_t sub_186507288()
{
  return MEMORY[0x1E0CE8408]();
}

uint64_t sub_186507294()
{
  return MEMORY[0x1E0CE8410]();
}

uint64_t sub_1865072A0()
{
  return MEMORY[0x1E0CE8418]();
}

uint64_t sub_1865072AC()
{
  return MEMORY[0x1E0CE8488]();
}

uint64_t sub_1865072B8()
{
  return MEMORY[0x1E0CE8490]();
}

uint64_t sub_1865072C4()
{
  return MEMORY[0x1E0CE8598]();
}

uint64_t sub_1865072D0()
{
  return MEMORY[0x1E0CE85B0]();
}

uint64_t sub_1865072DC()
{
  return MEMORY[0x1E0CE85B8]();
}

uint64_t sub_1865072E8()
{
  return MEMORY[0x1E0CE8678]();
}

uint64_t sub_1865072F4()
{
  return MEMORY[0x1E0CE8680]();
}

uint64_t sub_186507300()
{
  return MEMORY[0x1E0CE8688]();
}

uint64_t sub_18650730C()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_186507318()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_186507324()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_186507330()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_18650733C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_186507348()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t sub_186507354()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_186507360()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_18650736C()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_186507378()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_186507384()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_186507390()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_18650739C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1865073A8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1865073B4()
{
  return MEMORY[0x1E0CB1810]();
}

uint64_t sub_1865073C0()
{
  return MEMORY[0x1E0CB1818]();
}

uint64_t sub_1865073CC()
{
  return MEMORY[0x1E0CB1820]();
}

uint64_t sub_1865073D8()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1865073E4()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1865073F0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1865073FC()
{
  return MEMORY[0x1E0DE9EA8]();
}

uint64_t sub_186507408()
{
  return MEMORY[0x1E0DE9F78]();
}

uint64_t sub_186507414()
{
  return MEMORY[0x1E0DE9FC8]();
}

uint64_t sub_186507420()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_18650742C()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_186507438()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_186507444()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_186507450()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_18650745C()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_186507468()
{
  return MEMORY[0x1E0DEA260]();
}

uint64_t sub_186507474()
{
  return MEMORY[0x1E0DEA268]();
}

uint64_t sub_186507480()
{
  return MEMORY[0x1E0DEA280]();
}

uint64_t sub_18650748C()
{
  return MEMORY[0x1E0DF1F80]();
}

uint64_t sub_186507498()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1865074A4()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1865074B0()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1865074BC()
{
  return MEMORY[0x1E0DEA510]();
}

uint64_t sub_1865074C8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1865074D4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1865074E0()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1865074EC()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1865074F8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_186507504()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_186507510()
{
  return MEMORY[0x1E0CB1A50]();
}

uint64_t sub_18650751C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_186507528()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_186507534()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_186507540()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18650754C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_186507558()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_186507564()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_186507570()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_18650757C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_186507588()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_186507594()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1865075A0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1865075AC()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1865075B8()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1865075C4()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1865075D0()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1865075DC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1865075E8()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1865075F4()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_186507600()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_18650760C()
{
  return MEMORY[0x1E0DEAC68]();
}

uint64_t sub_186507618()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_186507624()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_186507630()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_18650763C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_186507648()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_186507654()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_186507660()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_18650766C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_186507678()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_186507684()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_186507690()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_18650769C()
{
  return MEMORY[0x1E0DC1850]();
}

uint64_t sub_1865076A8()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1865076B4()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1865076C0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1865076CC()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1865076D8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1865076E4()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1865076F0()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1865076FC()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_186507708()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_186507714()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_186507720()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_18650772C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_186507738()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_186507744()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_186507750()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_18650775C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_186507768()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_186507774()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_186507780()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_18650778C()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_186507798()
{
  return MEMORY[0x1E0DEB060]();
}

uint64_t sub_1865077A4()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1865077B0()
{
  return MEMORY[0x1E0CB1B90]();
}

uint64_t sub_1865077BC()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1865077C8()
{
  return MEMORY[0x1E0CB1BA0]();
}

uint64_t sub_1865077D4()
{
  return MEMORY[0x1E0DEB178]();
}

uint64_t sub_1865077E0()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1865077EC()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1865077F8()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_186507804()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_186507810()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_18650781C()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_186507828()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_186507834()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_186507840()
{
  return MEMORY[0x1E0DEB570]();
}

uint64_t sub_18650784C()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_186507858()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_186507864()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_186507870()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_18650787C()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_186507888()
{
  return MEMORY[0x1E0DEB740]();
}

uint64_t sub_186507894()
{
  return MEMORY[0x1E0DEB810]();
}

uint64_t sub_1865078A0()
{
  return MEMORY[0x1E0CB1C40]();
}

uint64_t sub_1865078AC()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_1865078B8()
{
  return MEMORY[0x1E0DEFD98]();
}

uint64_t sub_1865078C4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1865078D0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1865078DC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1865078E8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1865078F4()
{
  return MEMORY[0x1E0CB1DE8]();
}

uint64_t sub_186507900()
{
  return MEMORY[0x1E0DEFDA0]();
}

uint64_t sub_18650790C()
{
  return MEMORY[0x1E0DEFDA8]();
}

uint64_t sub_186507918()
{
  return MEMORY[0x1E0DEFDB0]();
}

uint64_t sub_186507924()
{
  return MEMORY[0x1E0DEFDB8]();
}

uint64_t sub_186507930()
{
  return MEMORY[0x1E0C9B998]();
}

uint64_t sub_18650793C()
{
  return MEMORY[0x1E0CB1E88]();
}

uint64_t sub_186507948()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_186507954()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_186507960()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_18650796C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_186507978()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_186507984()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_186507990()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_18650799C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1865079A8()
{
  return MEMORY[0x1E0CB1EC0]();
}

uint64_t sub_1865079B4()
{
  return MEMORY[0x1E0CB1EC8]();
}

uint64_t sub_1865079C0()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1865079CC()
{
  return MEMORY[0x1E0CA7958]();
}

uint64_t sub_1865079D8()
{
  return MEMORY[0x1E0DEFA60]();
}

uint64_t sub_1865079E4()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1865079F0()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1865079FC()
{
  return MEMORY[0x1E0CB1FB8]();
}

uint64_t sub_186507A08()
{
  return MEMORY[0x1E0CB1FE0]();
}

uint64_t sub_186507A14()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_186507A20()
{
  return MEMORY[0x1E0CB2060]();
}

uint64_t sub_186507A2C()
{
  return MEMORY[0x1E0CB20C8]();
}

uint64_t sub_186507A38()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_186507A44()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_186507A50()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_186507A5C()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_186507A68()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_186507A74()
{
  return MEMORY[0x1E0C9BA38]();
}

uint64_t sub_186507A80()
{
  return MEMORY[0x1E0C9BA40]();
}

uint64_t sub_186507A8C()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_186507A98()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_186507AA4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_186507AB0()
{
  return MEMORY[0x1E0DEB958]();
}

uint64_t sub_186507ABC()
{
  return MEMORY[0x1E0DEB960]();
}

uint64_t sub_186507AC8()
{
  return MEMORY[0x1E0DEBB50]();
}

uint64_t sub_186507AD4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_186507AE0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_186507AEC()
{
  return MEMORY[0x1E0CB2430]();
}

uint64_t sub_186507AF8()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_186507B04()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_186507B10()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_186507B1C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_186507B28()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_186507B34()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_186507B40()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_186507B4C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_186507B58()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_186507B64()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_186507B70()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_186507B7C()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_186507B88()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_186507B94()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_186507BA0()
{
  return MEMORY[0x1E0CB25C8]();
}

uint64_t sub_186507BAC()
{
  return MEMORY[0x1E0DEC160]();
}

uint64_t sub_186507BB8()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_186507BC4()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_186507BD0()
{
  return MEMORY[0x1E0DEC188]();
}

uint64_t sub_186507BDC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_186507BE8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_186507BF4()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_186507C00()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_186507C0C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_186507C18()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_186507C24()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_186507C30()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_186507C3C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_186507C48()
{
  return MEMORY[0x1E0DEC2C0]();
}

uint64_t sub_186507C54()
{
  return MEMORY[0x1E0DEC2D0]();
}

uint64_t sub_186507C60()
{
  return MEMORY[0x1E0DEC2F0]();
}

uint64_t sub_186507C6C()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_186507C78()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_186507C84()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_186507C90()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_186507C9C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_186507CA8()
{
  return MEMORY[0x1E0DEC508]();
}

uint64_t sub_186507CB4()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_186507CC0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_186507CCC()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_186507CD8()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_186507CE4()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_186507CF0()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_186507CFC()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_186507D08()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_186507D14()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_186507D20()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_186507D2C()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_186507D38()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_186507D44()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_186507D50()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_186507D5C()
{
  return MEMORY[0x1E0DF0BE8]();
}

uint64_t sub_186507D68()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_186507D74()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_186507D80()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_186507D8C()
{
  return MEMORY[0x1E0DEC970]();
}

uint64_t sub_186507D98()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_186507DA4()
{
  return MEMORY[0x1E0DECAE8]();
}

uint64_t sub_186507DB0()
{
  return MEMORY[0x1E0DECB08]();
}

uint64_t sub_186507DBC()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_186507DC8()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_186507DD4()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_186507DE0()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_186507DEC()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_186507DF8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_186507E04()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_186507E10()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_186507E1C()
{
  return MEMORY[0x1E0DECC10]();
}

uint64_t sub_186507E28()
{
  return MEMORY[0x1E0DECC18]();
}

uint64_t sub_186507E34()
{
  return MEMORY[0x1E0DECC20]();
}

uint64_t sub_186507E40()
{
  return MEMORY[0x1E0DECC28]();
}

uint64_t sub_186507E4C()
{
  return MEMORY[0x1E0DECC30]();
}

uint64_t sub_186507E58()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_186507E64()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_186507E70()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_186507E7C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_186507E88()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_186507E94()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_186507EA0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_186507EAC()
{
  return MEMORY[0x1E0CB25F0]();
}

uint64_t sub_186507EB8()
{
  return MEMORY[0x1E0DECDC8]();
}

uint64_t sub_186507EC4()
{
  return MEMORY[0x1E0DECDE0]();
}

uint64_t sub_186507ED0()
{
  return MEMORY[0x1E0DECE00]();
}

uint64_t sub_186507EDC()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_186507EE8()
{
  return MEMORY[0x1E0DECF08]();
}

uint64_t sub_186507EF4()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_186507F00()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_186507F0C()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_186507F18()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_186507F24()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_186507F30()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_186507F3C()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_186507F48()
{
  return MEMORY[0x1E0DED1B8]();
}

uint64_t sub_186507F54()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_186507F60()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_186507F6C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_186507F78()
{
  return MEMORY[0x1E0DED290]();
}

uint64_t sub_186507F84()
{
  return MEMORY[0x1E0DED3D0]();
}

uint64_t sub_186507F90()
{
  return MEMORY[0x1E0DED540]();
}

uint64_t sub_186507F9C()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_186507FA8()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_186507FB4()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_186507FC0()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_186507FCC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_186507FD8()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_186507FE4()
{
  return MEMORY[0x1E0DED648]();
}

uint64_t sub_186507FF0()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_186507FFC()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_186508008()
{
  return MEMORY[0x1E0DED6E8]();
}

uint64_t sub_186508014()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_186508020()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_18650802C()
{
  return MEMORY[0x1E0DED980]();
}

uint64_t sub_186508038()
{
  return MEMORY[0x1E0DED9A8]();
}

uint64_t sub_186508044()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_186508050()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_18650805C()
{
  return MEMORY[0x1E0DEDAC8]();
}

uint64_t sub_186508068()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_186508074()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_186508080()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_18650808C()
{
  return MEMORY[0x1E0DF0F10]();
}

uint64_t sub_186508098()
{
  return MEMORY[0x1E0DF0F18]();
}

uint64_t sub_1865080A4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1865080B0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1865080BC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1865080C8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1865080D4()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1865080E0()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1865080EC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1865080F8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_186508104()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_186508110()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_18650811C()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_186508128()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_186508134()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_186508140()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_18650814C()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t sub_186508158()
{
  return MEMORY[0x1E0DEDFF0]();
}

uint64_t sub_186508164()
{
  return MEMORY[0x1E0DEE018]();
}

uint64_t sub_186508170()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_18650817C()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_186508188()
{
  return MEMORY[0x1E0CB2718]();
}

uint64_t sub_186508194()
{
  return MEMORY[0x1E0CB2728]();
}

uint64_t sub_1865081A0()
{
  return MEMORY[0x1E0DEE180]();
}

uint64_t sub_1865081AC()
{
  return MEMORY[0x1E0DEE228]();
}

uint64_t sub_1865081B8()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1865081C4()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1865081D0()
{
  return MEMORY[0x1E0DEE258]();
}

uint64_t sub_1865081DC()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1865081E8()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1865081F4()
{
  return MEMORY[0x1E0DEE538]();
}

uint64_t sub_186508200()
{
  return MEMORY[0x1E0DEE6B8]();
}

uint64_t sub_18650820C()
{
  return MEMORY[0x1E0DEE6E0]();
}

uint64_t sub_186508218()
{
  return MEMORY[0x1E0DEE6F0]();
}

uint64_t sub_186508224()
{
  return MEMORY[0x1E0DEE780]();
}

uint64_t sub_186508230()
{
  return MEMORY[0x1E0DEE7C0]();
}

uint64_t sub_18650823C()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_186508248()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_186508254()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_186508260()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x1E0CF63C0]();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x1E0CF3040]();
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  return MEMORY[0x1E0DDD468]();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return (NSString *)MEMORY[0x1E0C8EDA8](color);
}

uint64_t AXPrefersNonBlinkingTextInsertionIndicator()
{
  return MEMORY[0x1E0C8EDB0]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x1E0D00960]();
}

uint64_t BKSDisplayServicesStart()
{
  return MEMORY[0x1E0D009D0]();
}

uint64_t BKSHIDEventContainsUpdates()
{
  return MEMORY[0x1E0D009F8]();
}

uint64_t BKSHIDEventDigitizerGetTouchLocus()
{
  return MEMORY[0x1E0D00A10]();
}

uint64_t BKSHIDEventEnumerateUpdatesWithBlock()
{
  return MEMORY[0x1E0D00A18]();
}

uint64_t BKSHIDEventGetBaseAttributes()
{
  return MEMORY[0x1E0D00A20]();
}

uint64_t BKSHIDEventGetDigitizerAttributes()
{
  return MEMORY[0x1E0D00A30]();
}

uint64_t BKSHIDEventGetKeyboardAttributes()
{
  return MEMORY[0x1E0D00A38]();
}

uint64_t BKSHIDEventGetPointerAttributes()
{
  return MEMORY[0x1E0D00A40]();
}

uint64_t BKSHIDEventRegisterEventCallbackOnRunLoop()
{
  return MEMORY[0x1E0D00A68]();
}

uint64_t BKSHIDEventSetAttributes()
{
  return MEMORY[0x1E0D00A80]();
}

uint64_t BKSHIDEventSetDigitizerAttributes()
{
  return MEMORY[0x1E0D00A88]();
}

uint64_t BKSHIDEventSetDigitizerInfo()
{
  return MEMORY[0x1E0D00A90]();
}

uint64_t BKSHIDEventSetDigitizerInfoWithSubEventInfos()
{
  return MEMORY[0x1E0D00A98]();
}

uint64_t BKSHIDKeyboardGetDeviceProperties()
{
  return MEMORY[0x1E0D00AB8]();
}

uint64_t BKSHIDKeyboardIsCapsLockLightOn()
{
  return MEMORY[0x1E0D00AC0]();
}

uint64_t BKSHIDKeyboardSetCapsLockActive()
{
  return MEMORY[0x1E0D00AC8]();
}

uint64_t BKSHIDKeyboardSetLayout()
{
  return MEMORY[0x1E0D00AD0]();
}

uint64_t BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel()
{
  return MEMORY[0x1E0D00B00]();
}

uint64_t BKSHIDServicesClaimGenericGestureFocus()
{
  return MEMORY[0x1E0D00B08]();
}

uint64_t BKSHIDServicesGetCALayerTransform()
{
  return MEMORY[0x1E0D00B18]();
}

uint64_t BKSHIDServicesGetHardwareKeyboardLanguage()
{
  return MEMORY[0x1E0D00B20]();
}

uint64_t BKSHIDServicesGetHumanPresenceStatus()
{
  return MEMORY[0x1E0D00B28]();
}

uint64_t BKSHIDServicesIsCapsLockLightOn()
{
  return MEMORY[0x1E0D00B38]();
}

uint64_t BKSHIDServicesRequestHapticFeedback()
{
  return MEMORY[0x1E0D00B80]();
}

uint64_t BKSHIDServicesSetCapsLockDelayOverride()
{
  return MEMORY[0x1E0D00BA0]();
}

uint64_t BKSHIDServicesSetCapsLockRomanSwitchMode()
{
  return MEMORY[0x1E0D00BA8]();
}

uint64_t BKSProcessAssertionBackgroundTimeRemaining()
{
  return MEMORY[0x1E0CFE2E0]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x1E0D00BF0]();
}

uint64_t BLSBacklightStateForVisuaState()
{
  return MEMORY[0x1E0D00EE8]();
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x1E0D010C0]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary()
{
  return MEMORY[0x1E0D01150]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01158]();
}

uint64_t BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01168]();
}

uint64_t BSCreateSerializedBSXPCEncodableObject()
{
  return MEMORY[0x1E0D01170]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1E0D01190]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011A0]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011C0]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011D0]();
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011E0]();
}

uint64_t BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011E8]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011F0]();
}

uint64_t BSDeviceOrientationDescription()
{
  return MEMORY[0x1E0D011F8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1E0D01270]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1E0D01340]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x1E0D01358]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x1E0D01368]();
}

uint64_t BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle()
{
  return MEMORY[0x1E0D013D0]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSLogCommon()
{
  return MEMORY[0x1E0D013E0]();
}

uint64_t BSMachSendRightRetain()
{
  return MEMORY[0x1E0D01418]();
}

uint64_t BSNSStringFromCGAffineTransform()
{
  return MEMORY[0x1E0D01428]();
}

uint64_t BSRunLoopPerformAfterCACommit()
{
  return MEMORY[0x1E0D01500]();
}

uint64_t BSRunLoopPerformRelativeToCACommit()
{
  return MEMORY[0x1E0D01508]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01528]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01548]();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01558]();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01568]();
}

uint64_t BSSerializeSetToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01570]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01578]();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return MEMORY[0x1E0D01580]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSSettingForKey()
{
  return MEMORY[0x1E0D015B0]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t CABackingStoreCollect()
{
  return MEMORY[0x1E0CD2310]();
}

uint64_t CABackingStoreCollectWithCompletionHandler()
{
  return MEMORY[0x1E0CD2320]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

uint64_t CAColorMatrixMakeBrightness()
{
  return MEMORY[0x1E0CD2340]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

uint64_t CAColorMatrixMakeMultiplyColor()
{
  return MEMORY[0x1E0CD2358]();
}

uint64_t CACornerRadiiEqualToRadii()
{
  return MEMORY[0x1E0CD2378]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

uint64_t CADisplayGetCurrentHeadroom()
{
  return MEMORY[0x1E0CD2398]();
}

uint64_t CADisplayGetPotentialHeadroom()
{
  return MEMORY[0x1E0CD23A0]();
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x1E0CD23B0]();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return MEMORY[0x1E0CD23B8]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CAGetCurrentImageBytes()
{
  return MEMORY[0x1E0CD23D8]();
}

uint64_t CAGetMaximumImageBytes()
{
  return MEMORY[0x1E0CD23E0]();
}

uint64_t CALayerFrameAffineTransform()
{
  return MEMORY[0x1E0CD24E0]();
}

uint64_t CALayerGetContext()
{
  return MEMORY[0x1E0CD24E8]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x1E0CD24F0]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1E0CD24F8]();
}

uint64_t CALayerGetSuperlayer()
{
  return MEMORY[0x1E0CD2500]();
}

uint64_t CALayerMapGeometry()
{
  return MEMORY[0x1E0CD2508]();
}

uint64_t CAPoint3DEqualToPoint()
{
  return MEMORY[0x1E0CD2530]();
}

uint64_t CARenderRelease()
{
  return MEMORY[0x1E0CD2550]();
}

uint64_t CARenderRetain()
{
  return MEMORY[0x1E0CD2558]();
}

uint64_t CARenderServerGetDirtyFrameCount()
{
  return MEMORY[0x1E0CD2570]();
}

uint64_t CARenderServerGetDirtyFrameCountByIndex()
{
  return MEMORY[0x1E0CD2578]();
}

uint64_t CARenderServerRenderLayerWithTransform()
{
  return MEMORY[0x1E0CD25B8]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1E0CD25E0]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1E0CD25F8](a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0CD2600](retstr, t);
}

uint64_t CATransform3DGetDecomposition_()
{
  return MEMORY[0x1E0CD2608]();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x1E0CD2618](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1E0CD2620](t);
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1E0CD2628](t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

uint64_t CATransform3DSetDecomposition_()
{
  return MEMORY[0x1E0CD2670]();
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

uint64_t CA_CGPointApplyTransform()
{
  return MEMORY[0x1E0CD26E8]();
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x1E0CD26F0]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D80](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98220](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98228](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1E0C98240](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x1E0C98298](calendar, tz);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x1E0C982A8](theSet, theString);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982D0](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

Boolean CFCharacterSetIsSupersetOfSet(CFCharacterSetRef theSet, CFCharacterSetRef theOtherset)
{
  return MEMORY[0x1E0C98330](theSet, theOtherset);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98458](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

uint64_t CFDateFormatterCreateDateFormatsFromTemplates()
{
  return MEMORY[0x1E0C98470]();
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98480](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1E0C984A8](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0C984C8](formatter, key, value);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C98748](*(_QWORD *)&gdate.year, *(_QWORD *)&gdate.second, tz);
  return result;
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFLocaleKey key, CFStringRef value)
{
  return (CFStringRef)MEMORY[0x1E0C98778](displayLocale, key, value);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return (CFMessagePortRef)MEMORY[0x1E0C98870](allocator, name);
}

Boolean CFMessagePortIsValid(CFMessagePortRef ms)
{
  return MEMORY[0x1E0C98890](ms);
}

SInt32 CFMessagePortSendRequest(CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef *returnData)
{
  return MEMORY[0x1E0C98898](remote, *(_QWORD *)&msgid, data, replyMode, returnData, sendTimeout, rcvTimeout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A38](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE0](rl, mode);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

Boolean CFRunLoopContainsObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  return MEMORY[0x1E0C98C08](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

void CFRunLoopObserverGetContext(CFRunLoopObserverRef observer, CFRunLoopObserverContext *context)
{
  MEMORY[0x1E0C98C70](observer, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
  MEMORY[0x1E0C98C78](observer);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D10](allocator, flags, order, block, fireDate, interval);
}

CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C98D30](timer);
  return result;
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x1E0C98D48](timer);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x1E0C98D58](timer, fireDate);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x1E0C98DD0](theSet, values);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x1E0C99078](theString, theFlags, theLocale);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x1E0C99160](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1E0C99238](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99280]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t CFUniCharIsMemberOf()
{
  return MEMORY[0x1E0C99598]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1E0C995D8](userNotification);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x1E0C9BA98](retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformMakeWithComponents(CGAffineTransform *__return_ptr retstr, CGAffineTransformComponents *components)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE8](retstr, components);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapContextCreateWithCallbacks()
{
  return MEMORY[0x1E0C9BB30]();
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BB68](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCA0](gray, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BCC0](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1E0C9BD10](colorName);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x1E0C9BD28](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE30](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF08](s);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF40](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF50](a1);
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1E0C9BF80]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1E0C9BFA0]();
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextAddQuadCurveToPoint(CGContextRef c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFE0](c, cpx, cpy, x, y);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x1E0C9C008](c, auxiliaryInfo);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x1E0C9C010](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextClear()
{
  return MEMORY[0x1E0C9C018]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x1E0C9C1A0](c, page);
}

uint64_t CGContextDrawPDFPageWithProgressCallback()
{
  return MEMORY[0x1E0C9C1B0]();
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C1D0](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

uint64_t CGContextDrawSVGDocument()
{
  return MEMORY[0x1E0D18848]();
}

void CGContextDrawShading(CGContextRef c, CGShadingRef shading)
{
  MEMORY[0x1E0C9C1D8](c, shading);
}

void CGContextDrawTiledImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C1E0](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEOClip(CGContextRef c)
{
  MEMORY[0x1E0C9C1E8](c);
}

void CGContextEOFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C1F0](c);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

uint64_t CGContextGetAlpha()
{
  return MEMORY[0x1E0C9C238]();
}

uint64_t CGContextGetBlendMode()
{
  return MEMORY[0x1E0C9C248]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9C260](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetCompositeOperation()
{
  return MEMORY[0x1E0C9C268]();
}

uint64_t CGContextGetFillColorAsColor()
{
  return MEMORY[0x1E0C9C280]();
}

uint64_t CGContextGetLineWidth()
{
  return MEMORY[0x1E0C9C2C0]();
}

uint64_t CGContextGetType()
{
  return MEMORY[0x1E0C9C318]();
}

BOOL CGContextIsPathEmpty(CGContextRef c)
{
  return MEMORY[0x1E0C9C328](c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextResetClip(CGContextRef c)
{
  MEMORY[0x1E0C9C360](c);
}

uint64_t CGContextResetState()
{
  return MEMORY[0x1E0C9C368]();
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1E0C9C378](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x1E0C9C380](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1E0C9C3D8]();
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1E0C9C3E8]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x1E0C9C3F8](c, components);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C400](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetFillPattern(CGContextRef c, CGPatternRef pattern, const CGFloat *components)
{
  MEMORY[0x1E0C9C410](c, pattern, components);
}

void CGContextSetFlatness(CGContextRef c, CGFloat flatness)
{
  MEMORY[0x1E0C9C418](c, flatness);
}

void CGContextSetFont(CGContextRef c, CGFontRef font)
{
  MEMORY[0x1E0C9C420](c, font);
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
  MEMORY[0x1E0C9C438](c, size);
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x1E0C9C448](c, gray, alpha);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
  MEMORY[0x1E0C9C490](c, limit);
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
  MEMORY[0x1E0C9C498](c, (__n128)phase, *(__n128 *)&phase.height);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C500](c, space);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextShowGlyphsAtPoint(CGContextRef c, CGFloat x, CGFloat y, const CGGlyph *glyphs, size_t count)
{
  MEMORY[0x1E0C9C540](c, glyphs, count, x, y);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C560](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C578](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
  MEMORY[0x1E0C9C580](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, width);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x1E0C9C5B0](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x1E0C9C5D0](consumer);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1E0C9C700](font);
}

CGFunctionRef CGFunctionCreate(void *info, size_t domainDimension, const CGFloat *domain, size_t rangeDimension, const CGFloat *range, const CGFunctionCallbacks *callbacks)
{
  return (CGFunctionRef)MEMORY[0x1E0C9C8F8](info, domainDimension, domain, rangeDimension, range, callbacks);
}

void CGFunctionRelease(CGFunctionRef function)
{
  MEMORY[0x1E0C9C920](function);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA80](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGGradientRef CGGradientRetain(CGGradientRef gradient)
{
  return (CGGradientRef)MEMORY[0x1E0C9CAC8](gradient);
}

uint64_t CGIOSurfaceContextCreate()
{
  return MEMORY[0x1E0C9CAD8]();
}

uint64_t CGIOSurfaceContextGetColorSpace()
{
  return MEMORY[0x1E0C9CAF0]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1E0CBC290]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

uint64_t CGImageCreateThumb()
{
  return MEMORY[0x1E0CBC2F0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CBD0](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1E0C9CC40](image);
}

uint64_t CGImageGetHeadroom()
{
  return MEMORY[0x1E0C9CC50]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetImageSource()
{
  return MEMORY[0x1E0CBC378]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x1E0C9CCA0](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1E0C9CCC0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1E0C9CCD8]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x1E0C9CCE8](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC550]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

uint64_t CGImageSourceGetTypeWithData()
{
  return MEMORY[0x1E0CBC628]();
}

uint64_t CGInitializeImageIO()
{
  return MEMORY[0x1E0CBC678]();
}

uint64_t CGMetalContextGetColorSpace()
{
  return MEMORY[0x1E0C9CE48]();
}

uint64_t CGPDFArchiveAddSelection()
{
  return MEMORY[0x1E0C9CE58]();
}

uint64_t CGPDFArchiveCreate()
{
  return MEMORY[0x1E0C9CE60]();
}

uint64_t CGPDFArchiveGetHTML()
{
  return MEMORY[0x1E0C9CE68]();
}

uint64_t CGPDFArchiveGetPlainText()
{
  return MEMORY[0x1E0C9CE70]();
}

uint64_t CGPDFArchiveGetWebArchiveData()
{
  return MEMORY[0x1E0C9CE78]();
}

uint64_t CGPDFArchiveRelease()
{
  return MEMORY[0x1E0C9CE80]();
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x1E0C9CE88](array);
}

BOOL CGPDFArrayGetDictionary(CGPDFArrayRef array, size_t index, CGPDFDictionaryRef *value)
{
  return MEMORY[0x1E0C9CE90](array, index, value);
}

BOOL CGPDFArrayGetInteger(CGPDFArrayRef array, size_t index, CGPDFInteger *value)
{
  return MEMORY[0x1E0C9CE98](array, index, value);
}

BOOL CGPDFArrayGetNumber(CGPDFArrayRef array, size_t index, CGPDFReal *value)
{
  return MEMORY[0x1E0C9CEA0](array, index, value);
}

BOOL CGPDFArrayGetString(CGPDFArrayRef array, size_t index, CGPDFStringRef *value)
{
  return MEMORY[0x1E0C9CEB0](array, index, value);
}

void CGPDFContextAddDestinationAtPoint(CGContextRef context, CFStringRef name, CGPoint point)
{
  MEMORY[0x1E0C9CEB8](context, name, (__n128)point, *(__n128 *)&point.y);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x1E0C9CEC0](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x1E0C9CEC8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9CED0](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9CED8](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x1E0C9CEE0](context);
}

void CGPDFContextSetDestinationForRect(CGContextRef context, CFStringRef name, CGRect rect)
{
  MEMORY[0x1E0C9CEE8](context, name, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPDFContextSetURLForRect(CGContextRef context, CFURLRef url, CGRect rect)
{
  MEMORY[0x1E0C9CEF0](context, url, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x1E0C9CEF8](dict, key, value);
}

BOOL CGPDFDictionaryGetDictionary(CGPDFDictionaryRef dict, const char *key, CGPDFDictionaryRef *value)
{
  return MEMORY[0x1E0C9CF00](dict, key, value);
}

BOOL CGPDFDictionaryGetName(CGPDFDictionaryRef dict, const char *key, const char **value)
{
  return MEMORY[0x1E0C9CF08](dict, key, value);
}

BOOL CGPDFDictionaryGetNumber(CGPDFDictionaryRef dict, const char *key, CGPDFReal *value)
{
  return MEMORY[0x1E0C9CF10](dict, key, value);
}

BOOL CGPDFDictionaryGetObject(CGPDFDictionaryRef dict, const char *key, CGPDFObjectRef *value)
{
  return MEMORY[0x1E0C9CF18](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x1E0C9CF28](dict, key, value);
}

BOOL CGPDFDocumentAllowsCopying(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF30](document);
}

BOOL CGPDFDocumentAllowsPrinting(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF38](document);
}

uint64_t CGPDFDocumentCopyPage()
{
  return MEMORY[0x1E0C9CF50]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF58](provider);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF60](url);
}

CGPDFDictionaryRef CGPDFDocumentGetCatalog(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x1E0C9CF70](document);
}

uint64_t CGPDFDocumentGetDataProvider()
{
  return MEMORY[0x1E0C9CF78]();
}

uint64_t CGPDFDocumentGetDestination()
{
  return MEMORY[0x1E0C9CF80]();
}

CGPDFArrayRef CGPDFDocumentGetID(CGPDFDocumentRef document)
{
  return (CGPDFArrayRef)MEMORY[0x1E0C9CF88](document);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF98](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1E0C9CFA0](document, pageNumber);
}

BOOL CGPDFDocumentIsUnlocked(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CFC0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x1E0C9CFC8](document);
}

CGPDFDocumentRef CGPDFDocumentRetain(CGPDFDocumentRef document)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CFD0](document);
}

BOOL CGPDFDocumentUnlockWithPassword(CGPDFDocumentRef document, const char *password)
{
  return MEMORY[0x1E0C9CFD8](document, password);
}

uint64_t CGPDFDrawingContextCreateWithStream()
{
  return MEMORY[0x1E0C9CFE0]();
}

uint64_t CGPDFDrawingContextDraw()
{
  return MEMORY[0x1E0C9CFE8]();
}

uint64_t CGPDFDrawingContextRelease()
{
  return MEMORY[0x1E0C9CFF0]();
}

uint64_t CGPDFFontDescriptorGetFlags()
{
  return MEMORY[0x1E0C9CFF8]();
}

uint64_t CGPDFFontGetFont()
{
  return MEMORY[0x1E0C9D000]();
}

uint64_t CGPDFFontGetFontDescriptor()
{
  return MEMORY[0x1E0C9D008]();
}

uint64_t CGPDFFormCreate()
{
  return MEMORY[0x1E0C9D010]();
}

uint64_t CGPDFFormGetBBox()
{
  return MEMORY[0x1E0C9D018]();
}

uint64_t CGPDFFormGetMatrix()
{
  return MEMORY[0x1E0C9D020]();
}

uint64_t CGPDFFormGetResources()
{
  return MEMORY[0x1E0C9D028]();
}

uint64_t CGPDFFormGetStream()
{
  return MEMORY[0x1E0C9D030]();
}

uint64_t CGPDFFormRelease()
{
  return MEMORY[0x1E0C9D038]();
}

uint64_t CGPDFLayoutCreateString()
{
  return MEMORY[0x1E0C9D040]();
}

uint64_t CGPDFLayoutGetCharacterBounds()
{
  return MEMORY[0x1E0C9D048]();
}

uint64_t CGPDFLayoutGetRootNode()
{
  return MEMORY[0x1E0C9D050]();
}

uint64_t CGPDFNodeGetBaseline()
{
  return MEMORY[0x1E0C9D058]();
}

uint64_t CGPDFNodeGetNodeContainingTextRange()
{
  return MEMORY[0x1E0C9D060]();
}

CGPDFObjectType CGPDFObjectGetType(CGPDFObjectRef object)
{
  return MEMORY[0x1E0C9D068](object);
}

BOOL CGPDFObjectGetValue(CGPDFObjectRef object, CGPDFObjectType type, void *value)
{
  return MEMORY[0x1E0C9D070](object, *(_QWORD *)&type, value);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D090](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGPDFDictionaryRef CGPDFPageGetDictionary(CGPDFPageRef page)
{
  return (CGPDFDictionaryRef)MEMORY[0x1E0C9D098](page);
}

CGPDFDocumentRef CGPDFPageGetDocument(CGPDFPageRef page)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9D0A0](page);
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9D0A8](retstr, page, *(_QWORD *)&box, *(_QWORD *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGPDFPageGetLayout()
{
  return MEMORY[0x1E0C9D0B0]();
}

size_t CGPDFPageGetPageNumber(CGPDFPageRef page)
{
  return MEMORY[0x1E0C9D0B8](page);
}

uint64_t CGPDFPageGetProperty()
{
  return MEMORY[0x1E0C9D0C0]();
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x1E0C9D0C8](page);
}

CFTypeID CGPDFPageGetTypeID(void)
{
  return MEMORY[0x1E0C9D0D0]();
}

void CGPDFPageRelease(CGPDFPageRef page)
{
  MEMORY[0x1E0C9D0E0](page);
}

uint64_t CGPDFPageRemoveLayout()
{
  return MEMORY[0x1E0C9D0E8]();
}

uint64_t CGPDFPageRemoveProperty()
{
  return MEMORY[0x1E0C9D0F0]();
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x1E0C9D0F8](page);
}

uint64_t CGPDFPageSetProperty()
{
  return MEMORY[0x1E0C9D100]();
}

uint64_t CGPDFSelectionCreateAtPoint()
{
  return MEMORY[0x1E0C9D108]();
}

uint64_t CGPDFSelectionCreateAtPointWithOptions()
{
  return MEMORY[0x1E0C9D110]();
}

uint64_t CGPDFSelectionCreateAttributedString()
{
  return MEMORY[0x1E0C9D118]();
}

uint64_t CGPDFSelectionCreateBetweenPoints()
{
  return MEMORY[0x1E0C9D120]();
}

uint64_t CGPDFSelectionCreateBetweenRangeAndPoint()
{
  return MEMORY[0x1E0C9D128]();
}

uint64_t CGPDFSelectionCreateContainingSelection()
{
  return MEMORY[0x1E0C9D130]();
}

uint64_t CGPDFSelectionCreateForRange()
{
  return MEMORY[0x1E0C9D138]();
}

uint64_t CGPDFSelectionCreateForStringRange()
{
  return MEMORY[0x1E0C9D140]();
}

uint64_t CGPDFSelectionCreateFromIndexToPoint()
{
  return MEMORY[0x1E0C9D148]();
}

uint64_t CGPDFSelectionCreateFromPointToIndex()
{
  return MEMORY[0x1E0C9D150]();
}

uint64_t CGPDFSelectionCreateFromSelection()
{
  return MEMORY[0x1E0C9D158]();
}

uint64_t CGPDFSelectionCreateInPath()
{
  return MEMORY[0x1E0C9D160]();
}

uint64_t CGPDFSelectionCreateIntersectingRect()
{
  return MEMORY[0x1E0C9D168]();
}

uint64_t CGPDFSelectionCreateSelectionsByLine()
{
  return MEMORY[0x1E0C9D170]();
}

uint64_t CGPDFSelectionCreateString()
{
  return MEMORY[0x1E0C9D178]();
}

uint64_t CGPDFSelectionExtendAtEnd()
{
  return MEMORY[0x1E0C9D180]();
}

uint64_t CGPDFSelectionExtendAtStart()
{
  return MEMORY[0x1E0C9D188]();
}

uint64_t CGPDFSelectionGetBounds()
{
  return MEMORY[0x1E0C9D190]();
}

uint64_t CGPDFSelectionGetCGFontAtIndex()
{
  return MEMORY[0x1E0C9D198]();
}

uint64_t CGPDFSelectionGetContentRect()
{
  return MEMORY[0x1E0C9D1A0]();
}

uint64_t CGPDFSelectionGetEndCursorXPosition()
{
  return MEMORY[0x1E0C9D1A8]();
}

uint64_t CGPDFSelectionGetEndIndex()
{
  return MEMORY[0x1E0C9D1B0]();
}

uint64_t CGPDFSelectionGetFirstIndex()
{
  return MEMORY[0x1E0C9D1B8]();
}

uint64_t CGPDFSelectionGetGlyphAtIndex()
{
  return MEMORY[0x1E0C9D1C0]();
}

uint64_t CGPDFSelectionGetLastIndex()
{
  return MEMORY[0x1E0C9D1C8]();
}

uint64_t CGPDFSelectionGetLength()
{
  return MEMORY[0x1E0C9D1D0]();
}

uint64_t CGPDFSelectionGetNumberOfRectsAndTransforms()
{
  return MEMORY[0x1E0C9D1D8]();
}

uint64_t CGPDFSelectionGetNumberOfTextRanges()
{
  return MEMORY[0x1E0C9D1E0]();
}

uint64_t CGPDFSelectionGetPage()
{
  return MEMORY[0x1E0C9D1E8]();
}

uint64_t CGPDFSelectionGetRangeForRectIndex()
{
  return MEMORY[0x1E0C9D1F0]();
}

uint64_t CGPDFSelectionGetRectAndTransform()
{
  return MEMORY[0x1E0C9D1F8]();
}

uint64_t CGPDFSelectionGetStartCursorXPosition()
{
  return MEMORY[0x1E0C9D200]();
}

uint64_t CGPDFSelectionGetStartIndex()
{
  return MEMORY[0x1E0C9D208]();
}

uint64_t CGPDFSelectionGetTextMatrixAtIndex()
{
  return MEMORY[0x1E0C9D210]();
}

uint64_t CGPDFSelectionGetTextRange()
{
  return MEMORY[0x1E0C9D218]();
}

uint64_t CGPDFSelectionIsEmpty()
{
  return MEMORY[0x1E0C9D220]();
}

uint64_t CGPDFSelectionIsStandaloneGraphic()
{
  return MEMORY[0x1E0C9D228]();
}

uint64_t CGPDFSelectionIsWithinLayout()
{
  return MEMORY[0x1E0C9D230]();
}

uint64_t CGPDFSelectionIsWord()
{
  return MEMORY[0x1E0C9D238]();
}

uint64_t CGPDFSelectionRelease()
{
  return MEMORY[0x1E0C9D240]();
}

uint64_t CGPDFSelectionRetain()
{
  return MEMORY[0x1E0C9D248]();
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x1E0C9D268](string);
}

const unsigned __int8 *__cdecl CGPDFStringGetBytePtr(CGPDFStringRef string)
{
  return (const unsigned __int8 *)MEMORY[0x1E0C9D270](string);
}

size_t CGPDFStringGetLength(CGPDFStringRef string)
{
  return MEMORY[0x1E0C9D278](string);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

uint64_t CGPathAddContinuousRoundedRect()
{
  return MEMORY[0x1E0C9D290]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2A0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
  MEMORY[0x1E0C9D2B0](path, m, points, count);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x1E0C9D2B8](path1, m, path2);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
  MEMORY[0x1E0C9D2D8](path, transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x1E0C9D2E8](path, info, function);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1E0C9D318](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D320](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D390](path);
}

CGMutablePathRef CGPathCreateMutableCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D398](path, transform);
}

CFArrayRef CGPathCreateSeparateComponents(CGPathRef path, BOOL evenOddFillRule)
{
  return (CFArrayRef)MEMORY[0x1E0C9D3A0](path, evenOddFillRule);
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1E0C9D3B0]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithThresholdedImage()
{
  return MEMORY[0x1E0C9D3D8]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x1E0C9D3E8](path1, path2);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x1E0C9D3F8](path);
  result.y = v2;
  result.x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D410](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1E0C9D448](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x1E0C9D4A8](info, matrix, *(_QWORD *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

uint64_t CGPatternCreateWithImage2()
{
  return MEMORY[0x1E0C9D4B0]();
}

uint64_t CGPatternGetImage()
{
  return MEMORY[0x1E0C9D4C0]();
}

uint64_t CGPatternGetMatrix()
{
  return MEMORY[0x1E0C9D4C8]();
}

uint64_t CGPatternGetStep()
{
  return MEMORY[0x1E0C9D4D8]();
}

uint64_t CGPatternGetTiling()
{
  return MEMORY[0x1E0C9D4E0]();
}

void CGPatternRelease(CGPatternRef pattern)
{
  MEMORY[0x1E0C9D510](pattern);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x1E0C9D520](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGRegionContainsRect()
{
  return MEMORY[0x1E0C9D658]();
}

uint64_t CGRegionCreateEmptyRegion()
{
  return MEMORY[0x1E0C9D668]();
}

uint64_t CGRegionCreateUnionWithRect()
{
  return MEMORY[0x1E0C9D678]();
}

uint64_t CGRegionCreateWithRect()
{
  return MEMORY[0x1E0C9D688]();
}

uint64_t CGSNewEmptyRegion()
{
  return MEMORY[0x1E0C9D730]();
}

uint64_t CGSNewRegionWithRect()
{
  return MEMORY[0x1E0C9D740]();
}

uint64_t CGSNextPoint()
{
  return MEMORY[0x1E0C9D748]();
}

uint64_t CGSRegionPathEnumerator()
{
  return MEMORY[0x1E0C9D770]();
}

uint64_t CGSReleaseRegion()
{
  return MEMORY[0x1E0C9D778]();
}

uint64_t CGSReleaseRegionEnumerator()
{
  return MEMORY[0x1E0C9D780]();
}

uint64_t CGSUnionRegion()
{
  return MEMORY[0x1E0C9D790]();
}

uint64_t CGSVGDocumentGetCanvasSize()
{
  return MEMORY[0x1E0D18858]();
}

uint64_t CGSVGDocumentGetTypeID()
{
  return MEMORY[0x1E0D18868]();
}

uint64_t CGSVGDocumentRelease()
{
  return MEMORY[0x1E0D18870]();
}

uint64_t CGSVGDocumentRetain()
{
  return MEMORY[0x1E0D18878]();
}

CGShadingRef CGShadingCreateAxial(CGColorSpaceRef space, CGPoint start, CGPoint end, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x1E0C9D798](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, (__n128)end, *(__n128 *)&end.y);
}

void CGShadingRelease(CGShadingRef shading)
{
  MEMORY[0x1E0C9D7E8](shading);
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x1E0C9D7F8](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1E0C9D810]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x1E0D08B98]();
}

uint64_t CMPhotoCompressionSessionAddImageToSequence()
{
  return MEMORY[0x1E0D08C08]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1E0D08C38]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1E0D08C40]();
}

uint64_t CMPhotoCompressionSessionEndImageSequence()
{
  return MEMORY[0x1E0D08C50]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x1E0D08C78]();
}

uint64_t CMPhotoCompressionSessionStartImageSequence()
{
  return MEMORY[0x1E0D08CA0]();
}

uint64_t CMPhotoDecompressionContainerCreateDictionaryDescription()
{
  return MEMORY[0x1E0D08E50]();
}

uint64_t CMPhotoDecompressionContainerCreateImageForIndex()
{
  return MEMORY[0x1E0D08E58]();
}

uint64_t CMPhotoDecompressionContainerCreateSequenceContainer()
{
  return MEMORY[0x1E0D08E78]();
}

uint64_t CMPhotoDecompressionContainerDecodeImageForIndexAsync()
{
  return MEMORY[0x1E0D08EB0]();
}

uint64_t CMPhotoDecompressionContainerGetImageCount()
{
  return MEMORY[0x1E0D08F20]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1E0D08FE0]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1E0D08FE8]();
}

uint64_t CMPhotoJPEGDecodeSessionCreate()
{
  return MEMORY[0x1E0D09130]();
}

uint64_t CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously()
{
  return MEMORY[0x1E0D09148]();
}

uint64_t CMPhotoJPEGDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x1E0D09158]();
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1E0CFA1C8]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1E0CFA1D8]();
}

uint64_t CPBitmapWriteImagesToPath()
{
  return MEMORY[0x1E0CFA1E0]();
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x1E0CFA228]();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return MEMORY[0x1E0CFA248]();
}

uint64_t CPGetMachPortForMIGServerSource()
{
  return MEMORY[0x1E0CFA2A8]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x1E0CFA370]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

CFArrayRef CTFontCopyDefaultCascadeListForLanguages(CTFontRef font, CFArrayRef languagePrefList)
{
  return (CFArrayRef)MEMORY[0x1E0CA7980](font, languagePrefList);
}

CFStringRef CTFontCopyLocalizedName(CTFontRef font, CFStringRef nameKey, CFStringRef *actualLanguage)
{
  return (CFStringRef)MEMORY[0x1E0CA79D0](font, nameKey, actualLanguage);
}

uint64_t CTFontCopySampleStringWithLanguages()
{
  return MEMORY[0x1E0CA79E8]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

uint64_t CTFontCopyTallestTextStyleLanguageForString()
{
  return MEMORY[0x1E0CA7A08]();
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7A10](font);
}

CFArrayRef CTFontCopyVariationAxes(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1E0CA7A18](font);
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1E0CA7A28]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1E0CA7A30](font, matrix, attributes, size);
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x1E0CA7A38](font, matrix, *(_QWORD *)&symTraitValue, *(_QWORD *)&symTraitMask, size);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1E0CA7A60](font, glyph, matrix);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A88](name, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

CFTypeRef CTFontDescriptorCopyLocalizedAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute, CFStringRef *language)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AB0](descriptor, attribute, language);
}

uint64_t CTFontDescriptorCreateMatchingFontDescriptorsWithOptions()
{
  return MEMORY[0x1E0CA7AF8]();
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x1E0CA7B08]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B10](name, size);
}

uint64_t CTFontDescriptorGetSymbolicTraits()
{
  return MEMORY[0x1E0CA7B38]();
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1E0CA7B40]();
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
  MEMORY[0x1E0CA7B70](font, glyphs, positions, count, context);
}

uint64_t CTFontGetAccessibilityBoldWeightOfWeight()
{
  return MEMORY[0x1E0CA7B90]();
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x1E0CA7B98](font, *(_QWORD *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BA0](font);
  return result;
}

uint64_t CTFontGetAscentForSystemFontOfSize()
{
  return MEMORY[0x1E0CA7BA8]();
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x1E0CA7BB8](font, *(_QWORD *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

uint64_t CTFontGetCapHeightForSystemFontOfSize()
{
  return MEMORY[0x1E0CA7BC8]();
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BD8](font);
  return result;
}

uint64_t CTFontGetDescentForSystemFontOfSize()
{
  return MEMORY[0x1E0CA7BE0]();
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1E0CA7C08](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

CGRect CTFontGetOpticalBoundsForGlyphs(CTFontRef font, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count, CFOptionFlags options)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x1E0CA7C38](font, glyphs, boundingRects, count, options);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return MEMORY[0x1E0CA7C60](font);
}

uint64_t CTFontGetUIFontDesign()
{
  return MEMORY[0x1E0CA7C88]();
}

uint64_t CTFontGetWeight()
{
  return MEMORY[0x1E0CA7CC8]();
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7CD0](font);
  return result;
}

uint64_t CTFontIsAppleColorEmoji()
{
  return MEMORY[0x1E0CA7CF8]();
}

uint64_t CTFontSetAltTextStyleSpec()
{
  return MEMORY[0x1E0CA7D60]();
}

uint64_t CTFontTransformGlyphs()
{
  return MEMORY[0x1E0CA7D88]();
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x1E0CA7DA8](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1E0CA7DB0](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x1E0CA7DF8](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

uint64_t CTGetDefaultLanguageAwareLineHeightRatio()
{
  return MEMORY[0x1E0CA7E00]();
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1E0CA7E70](line, *(_QWORD *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1E0CA7E98]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return MEMORY[0x1E0CA7ED0](line);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1E0CA7ED8](line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EE0](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  double result;

  MEMORY[0x1E0CA7EF0](line, flushFactor, flushWidth);
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  double result;

  MEMORY[0x1E0CA7F10](line);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x1E0CA7F60](settings, settingCount);
}

uint64_t CTParagraphStyleSetCompositionLanguage()
{
  return MEMORY[0x1E0CA7F78]();
}

void CTRunDraw(CTRunRef run, CGContextRef context, CFRange range)
{
  MEMORY[0x1E0CA7F98](run, context, range.location, range.length);
}

uint64_t CTRunGetFont()
{
  return MEMORY[0x1E0CA7FC8]();
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1E0CA7FD0](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
  MEMORY[0x1E0CA7FE0](run, range.location, range.length, buffer);
}

CGRect CTRunGetImageBounds(CTRunRef run, CGContextRef context, CFRange range)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0CA7FF0](run, context, range.location, range.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
  MEMORY[0x1E0CA8008](run, range.location, range.length, buffer);
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0CA8040](run);
  result.length = v2;
  result.location = v1;
  return result;
}

CGAffineTransform *__cdecl CTRunGetTextMatrix(CGAffineTransform *__return_ptr retstr, CTRunRef run)
{
  return (CGAffineTransform *)MEMORY[0x1E0CA8048](retstr, run);
}

uint64_t CUIGetDeviceArtworkDisplayGamut()
{
  return MEMORY[0x1E0D1A688]();
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1E0D1D238]();
}

uint64_t FBSWorkspaceInitialize()
{
  return MEMORY[0x1E0D22F20]();
}

uint64_t FBSceneLayerTypeMaskContainsType()
{
  return MEMORY[0x1E0D22850]();
}

uint64_t GSCurrentEventTimestamp()
{
  return MEMORY[0x1E0D27AD0]();
}

uint64_t GSEventAccelerometerAxisX()
{
  return MEMORY[0x1E0D27AD8]();
}

uint64_t GSEventAccelerometerAxisY()
{
  return MEMORY[0x1E0D27AE0]();
}

uint64_t GSEventAccelerometerAxisZ()
{
  return MEMORY[0x1E0D27AE8]();
}

uint64_t GSEventCreateWithEventRecord()
{
  return MEMORY[0x1E0D27AF0]();
}

uint64_t GSEventDeviceOrientation()
{
  return MEMORY[0x1E0D27AF8]();
}

uint64_t GSEventGetHIDTimestamp()
{
  return MEMORY[0x1E0D27B00]();
}

uint64_t GSEventGetHardwareKeyboardCountry()
{
  return MEMORY[0x1E0D27B08]();
}

uint64_t GSEventGetLocationInWindow()
{
  return MEMORY[0x1E0D27B18]();
}

uint64_t GSEventGetSubType()
{
  return MEMORY[0x1E0D27B20]();
}

uint64_t GSEventGetTimestamp()
{
  return MEMORY[0x1E0D27B28]();
}

uint64_t GSEventGetType()
{
  return MEMORY[0x1E0D27B30]();
}

uint64_t GSEventGetWindow()
{
  return MEMORY[0x1E0D27B38]();
}

uint64_t GSEventInitialize()
{
  return MEMORY[0x1E0D27B40]();
}

uint64_t GSEventInitializeAsExtension()
{
  return MEMORY[0x1E0D27B48]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1E0D27B50]();
}

uint64_t GSEventIsHardwareKeyboardEvent()
{
  return MEMORY[0x1E0D27B58]();
}

uint64_t GSEventPopRunLoopMode()
{
  return MEMORY[0x1E0D27B60]();
}

uint64_t GSEventPushRunLoopMode()
{
  return MEMORY[0x1E0D27B68]();
}

uint64_t GSEventQueueContainsMouseEvent()
{
  return MEMORY[0x1E0D27B70]();
}

uint64_t GSEventRegisterEventCallBack()
{
  return MEMORY[0x1E0D27B78]();
}

uint64_t GSEventRemoveShouldRouteToFrontMost()
{
  return MEMORY[0x1E0D27B80]();
}

uint64_t GSEventRun()
{
  return MEMORY[0x1E0D27B88]();
}

uint64_t GSEventShouldRouteToFrontMost()
{
  return MEMORY[0x1E0D27BA0]();
}

uint64_t GSInitialize()
{
  return MEMORY[0x1E0D27BB8]();
}

uint64_t GSKeyboardCreate()
{
  return MEMORY[0x1E0D27BC0]();
}

uint64_t GSKeyboardGetHWKeyboardType()
{
  return MEMORY[0x1E0D27BC8]();
}

uint64_t GSKeyboardGetKeyCodeForChar()
{
  return MEMORY[0x1E0D27BD0]();
}

uint64_t GSKeyboardGetLayout()
{
  return MEMORY[0x1E0D27BD8]();
}

uint64_t GSKeyboardGetLiveModifierState()
{
  return MEMORY[0x1E0D27BE8]();
}

uint64_t GSKeyboardGetLocale()
{
  return MEMORY[0x1E0D27BF0]();
}

uint64_t GSKeyboardGetModifierState()
{
  return MEMORY[0x1E0D27C00]();
}

uint64_t GSKeyboardIsGlobeKeyUsagePair()
{
  return MEMORY[0x1E0D27C08]();
}

uint64_t GSKeyboardRelease()
{
  return MEMORY[0x1E0D27C18]();
}

uint64_t GSKeyboardTranslateKeyExtendedCommandWithUsagePage()
{
  return MEMORY[0x1E0D27C28]();
}

uint64_t GSKeyboardTranslateKeyWithModifiers()
{
  return MEMORY[0x1E0D27C38]();
}

uint64_t GSMainScreenPointSize()
{
  return MEMORY[0x1E0D27C50]();
}

uint64_t GSSendEvent()
{
  return MEMORY[0x1E0D27C68]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
}

uint64_t HTBeginNonResponsiveTaskWithNameAndExpirationAtTime()
{
  return MEMORY[0x1E0D28780]();
}

uint64_t HTEndNonResponsiveTaskAtTime()
{
  return MEMORY[0x1E0D28798]();
}

uint64_t HTHangEventAddUserActionCaptureCallback()
{
  return MEMORY[0x1E0D287A0]();
}

uint64_t HTHangEventCreate()
{
  return MEMORY[0x1E0D287A8]();
}

uint64_t HTResumeHangTracing()
{
  return MEMORY[0x1E0D287B0]();
}

uint64_t HTSuspendHangTracing()
{
  return MEMORY[0x1E0D287B8]();
}

uint64_t HTUpdateHangTracing()
{
  return MEMORY[0x1E0D287C0]();
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x1E0CBB008]();
}

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x1E0CBB010]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x1E0CBB030]();
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1E0CBB038]();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return MEMORY[0x1E0CBB040]();
}

uint64_t IOHIDEventCreateDigitizerFingerEvent()
{
  return MEMORY[0x1E0CBB048]();
}

uint64_t IOHIDEventCreateDigitizerFingerEventWithQuality()
{
  return MEMORY[0x1E0CBB050]();
}

uint64_t IOHIDEventCreateDigitizerStylusEventWithPolarOrientation()
{
  return MEMORY[0x1E0CBB058]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x1E0CBB078]();
}

uint64_t IOHIDEventCreateScaleEvent()
{
  return MEMORY[0x1E0CBB0A0]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x1E0CBB0D0]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x1E0CBB0E0]();
}

uint64_t IOHIDEventGetAttributeDataLength()
{
  return MEMORY[0x1E0CBB0E8]();
}

uint64_t IOHIDEventGetAttributeDataPtr()
{
  return MEMORY[0x1E0CBB0F0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1E0CBB0F8]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x1E0CBB100]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x1E0CBB108]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x1E0CBB110]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x1E0CBB118]();
}

uint64_t IOHIDEventGetFloatMultiple()
{
  return MEMORY[0x1E0CBB120]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1E0CBB128]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetLatency()
{
  return MEMORY[0x1E0CBB138]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x1E0CBB148]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1E0CBB150]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1E0CBB158]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventGetVendorDefinedData()
{
  return MEMORY[0x1E0CBB178]();
}

uint64_t IOHIDEventIsRepeat()
{
  return MEMORY[0x1E0CBB180]();
}

uint64_t IOHIDEventRemoveEvent()
{
  return MEMORY[0x1E0CBB188]();
}

uint64_t IOHIDEventSetAttributeData()
{
  return MEMORY[0x1E0CBB190]();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return MEMORY[0x1E0CBB198]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x1E0CBB1A8]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x1E0CBB1B0]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x1E0CBB1B8]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x1E0CBB1C0]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x1E0CBB1C8]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1E0CBB1E8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1E0CBB380](manager, *(_QWORD *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1E0CBB388](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1E0CBB3A0](allocator, *(_QWORD *)&options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1E0CBB3B8](manager, *(_QWORD *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x1E0CBB3C0](manager, callback, context);
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x1E0CBB3C8](manager, callback, context);
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x1E0CBB3E0](manager, runLoop, runLoopMode);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
  MEMORY[0x1E0CBB3F8](manager, multiple);
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1E0CBB868]();
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x1E0CBB870]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1E0CBB880](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBB8A8](blob, ps);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1E0CBBAC0](property, value);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBB18](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1E0CBBB70]();
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB80](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1E0CBBCC8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBD00](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1E0DE2B78]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MTMaterialCreateDictionaryRepresentation()
{
  return MEMORY[0x1E0D16BF8]();
}

uint64_t MTVisualStylingCreateDictionaryRepresentation()
{
  return MEMORY[0x1E0D16C00]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2858](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

BOOL NSCompareHashTables(NSHashTable *table1, NSHashTable *table2)
{
  return MEMORY[0x1E0CB28B8](table1, table2);
}

BOOL NSCompareMapTables(NSMapTable *table1, NSMapTable *table2)
{
  return MEMORY[0x1E0CB28C0](table1, table2);
}

NSUInteger NSCountMapTable(NSMapTable *table)
{
  return MEMORY[0x1E0CB28E8](table);
}

NSMapTable *__cdecl NSCreateMapTable(NSMapTableKeyCallBacks *keyCallBacks, NSMapTableValueCallBacks *valueCallBacks, NSUInteger capacity)
{
  return (NSMapTable *)MEMORY[0x1E0CB28F8](keyCallBacks, valueCallBacks, capacity);
}

void NSEndHashTableEnumeration(NSHashEnumerator *enumerator)
{
  MEMORY[0x1E0CB2998](enumerator);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSHashEnumerator *__cdecl NSEnumerateHashTable(NSHashEnumerator *__return_ptr retstr, NSHashTable *table)
{
  return (NSHashEnumerator *)MEMORY[0x1E0CB29A8](retstr, table);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB29C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1E0CB29C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BD0](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BD8](table, pointer);
}

void NSHashRemove(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BF0](table, pointer);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSRect NSIntegralRectWithOptions(NSRect aRect, NSAlignmentOptions opts)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x1E0CB2C50](opts, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

BOOL NSIntersectsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB2C70]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1E0CB2C90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSLayoutConstraintIsDanglyInContainer()
{
  return MEMORY[0x1E0D15698]();
}

uint64_t NSLayoutConstraintIsPotentiallyDanglyInContainer()
{
  return MEMORY[0x1E0D156A0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

void *__cdecl NSNextHashEnumeratorItem(NSHashEnumerator *enumerator)
{
  return (void *)MEMORY[0x1E0CB2F80](enumerator);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1E0CB3038]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1E0CB3120]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromFBSceneLayerTypeMask()
{
  return MEMORY[0x1E0D228A0]();
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRect NSUnionRect(NSRect aRect, NSRect bRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x1E0CB3408]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1E0C805C8](libraryName);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

uint64_t PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError()
{
  return MEMORY[0x1E0D6C100]();
}

uint64_t PBCannotInstantiateObjectOfClassError()
{
  return MEMORY[0x1E0D6C108]();
}

uint64_t PBCannotLoadRepresentationError()
{
  return MEMORY[0x1E0D6C110]();
}

uint64_t PBIndexOutOfRangeError()
{
  return MEMORY[0x1E0D6C120]();
}

uint64_t PBNSPreferredRepresentationFromPB()
{
  return MEMORY[0x1E0D6C150]();
}

uint64_t PKGet_INV_PTM_RATIO()
{
  return MEMORY[0x1E0D7D350]();
}

uint64_t PKGet_PTM_RATIO()
{
  return MEMORY[0x1E0D7D358]();
}

uint64_t PKSet_PTM_Ratio()
{
  return MEMORY[0x1E0D7D368]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PSContentOverlayIntensityForLuminanceAndUsage()
{
  return MEMORY[0x1E0D7F430]();
}

uint64_t PSContentOverlayVibrantColorMatrixForLuminance()
{
  return MEMORY[0x1E0D7F438]();
}

uint64_t PSIntensityForLuminanceAndUsage()
{
  return MEMORY[0x1E0D7F440]();
}

uint64_t RBColorFromCGColor2()
{
  return MEMORY[0x1E0D87458]();
}

uint64_t RBColorModeWorkingColorSpace()
{
  return MEMORY[0x1E0D87460]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

uint64_t TIBundleForInputMode()
{
  return MEMORY[0x1E0DBDE10]();
}

uint64_t TIBundlePathForInputMode()
{
  return MEMORY[0x1E0DBDE18]();
}

uint64_t TICanonicalInputModeName()
{
  return MEMORY[0x1E0DBDE50]();
}

uint64_t TICharEstablishesContextForDoubleSpacePeriod()
{
  return MEMORY[0x1E0DBDE58]();
}

uint64_t TICharIsAlphaNumeric()
{
  return MEMORY[0x1E0DBDE60]();
}

uint64_t TICharIsComposableAccent()
{
  return MEMORY[0x1E0DBDE68]();
}

uint64_t TICharIsDevanagariPUA()
{
  return MEMORY[0x1E0DBDE70]();
}

uint64_t TIEnabledInputModesAllowOneToManyShortcuts()
{
  return MEMORY[0x1E0DBDF00]();
}

uint64_t TIGetDefaultInputModesForLanguage()
{
  return MEMORY[0x1E0DBDF18]();
}

uint64_t TIGetHardwareLayoutsForInputMode()
{
  return MEMORY[0x1E0DBDF20]();
}

uint64_t TIGetInputModeProperties()
{
  return MEMORY[0x1E0DBDF28]();
}

uint64_t TIGetLanguageSupportForHardwareKeyboard()
{
  return MEMORY[0x1E0DBDF30]();
}

uint64_t TIGetSuggestedDefaultInputModesByLocaleForLanguage()
{
  return MEMORY[0x1E0DBDF48]();
}

uint64_t TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage()
{
  return MEMORY[0x1E0DBDF50]();
}

uint64_t TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage()
{
  return MEMORY[0x1E0DBDF58]();
}

uint64_t TIGetSuggestedInputModesByLocaleForLanguage()
{
  return MEMORY[0x1E0DBDF60]();
}

uint64_t TIInputModeGetBaseLanguage()
{
  return MEMORY[0x1E0DBDFC8]();
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x1E0DBDFD0]();
}

uint64_t TIInputModeGetLanguage()
{
  return MEMORY[0x1E0DBDFE0]();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return MEMORY[0x1E0DBDFE8]();
}

uint64_t TIInputModeGetMultilingualID()
{
  return MEMORY[0x1E0DBDFF0]();
}

uint64_t TIInputModeGetMultilingualSet()
{
  return MEMORY[0x1E0DBDFF8]();
}

uint64_t TIInputModeGetMultilingualSetFromInputModes()
{
  return MEMORY[0x1E0DBE000]();
}

uint64_t TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages()
{
  return MEMORY[0x1E0DBE008]();
}

uint64_t TIInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x1E0DBE010]();
}

uint64_t TIInputModeGetNormalizedIdentifierFromComponents()
{
  return MEMORY[0x1E0DBE018]();
}

uint64_t TIInputModeGetNormalizedLevelsFromComponents()
{
  return MEMORY[0x1E0DBE020]();
}

uint64_t TIInputModeGetRegion()
{
  return MEMORY[0x1E0DBE028]();
}

uint64_t TIInputModeGetSWLayout()
{
  return MEMORY[0x1E0DBE030]();
}

uint64_t TIInputModeGetVariant()
{
  return MEMORY[0x1E0DBE038]();
}

uint64_t TIInputModeIsMultilingualOnly()
{
  return MEMORY[0x1E0DBE040]();
}

uint64_t TIInputModeIsTransliteration()
{
  return MEMORY[0x1E0DBE048]();
}

uint64_t TILoadMergedKeyboardPlistForLocale()
{
  return MEMORY[0x1E0DBE458]();
}

uint64_t TINgramModelPathForInputMode()
{
  return MEMORY[0x1E0DBE468]();
}

uint64_t TIStaticUnigramsFilePathForInputModeAndFileExtension()
{
  return MEMORY[0x1E0DBE508]();
}

uint64_t TIStatisticDistributionPushValue()
{
  return MEMORY[0x1E0DBE720]();
}

uint64_t TIStatisticGetKey()
{
  return MEMORY[0x1E0DBE748]();
}

uint64_t TIStatisticGetKeyForCandidateAccepted()
{
  return MEMORY[0x1E0DBE750]();
}

uint64_t TIStatisticGetKeyForCandidateAcceptedSelectedSortingMethod()
{
  return MEMORY[0x1E0DBE758]();
}

uint64_t TIStatisticGetKeyForInputMode()
{
  return MEMORY[0x1E0DBE760]();
}

uint64_t TIStatisticGetKeyForTenKeyFlick()
{
  return MEMORY[0x1E0DBE770]();
}

uint64_t TIStatisticGetKeyForTenKeyFlickPunctuation()
{
  return MEMORY[0x1E0DBE778]();
}

uint64_t TIStatisticGetKeyForTenKeyKeyTappedInKeyplane()
{
  return MEMORY[0x1E0DBE780]();
}

uint64_t TIStatisticScalarDecrement()
{
  return MEMORY[0x1E0DBE8D8]();
}

uint64_t TIStatisticScalarIncrement()
{
  return MEMORY[0x1E0DBE8E0]();
}

uint64_t TIStatisticScalarIncrement3PKSummoned()
{
  return MEMORY[0x1E0DBE8E8]();
}

uint64_t TIStatisticScalarIncrementAutocorrectionKey()
{
  return MEMORY[0x1E0DBE8F0]();
}

uint64_t TIStatisticScalarIncrementInputStringCount()
{
  return MEMORY[0x1E0DBE8F8]();
}

uint64_t TIStatisticScalarIncrementSystemKeyboardSummoned()
{
  return MEMORY[0x1E0DBE900]();
}

uint64_t TIStatisticScalarSetBoolean()
{
  return MEMORY[0x1E0DBE908]();
}

uint64_t TIStatisticScalarSetValue()
{
  return MEMORY[0x1E0DBE910]();
}

uint64_t TIStatisticShouldSample()
{
  return MEMORY[0x1E0DBE920]();
}

uint64_t TIStatisticsGetKeyForGesture()
{
  return MEMORY[0x1E0DBE958]();
}

uint64_t UIDataLooksLikeNibArchive()
{
  return off_1E167DBD0();
}

uint64_t UISCalloutBarFontSize()
{
  return MEMORY[0x1E0DC5CA0]();
}

uint64_t UISCreateCachedColorTransform()
{
  return MEMORY[0x1E0DC5CB0]();
}

uint64_t UISFontWeightForIndex()
{
  return MEMORY[0x1E0DC5CD8]();
}

uint64_t UISGetFontContentSizeCategory()
{
  return MEMORY[0x1E0DC5CE0]();
}

uint64_t UISIndexForFontWeight()
{
  return MEMORY[0x1E0DC5CE8]();
}

uint64_t UISSecureControlServiceSharedRemoteInterface()
{
  return MEMORY[0x1E0DC5D18]();
}

uint64_t UISUserInterfaceStyleModeOverridesEqual()
{
  return MEMORY[0x1E0DC5D50]();
}

uint64_t UISUserInterfaceStyleModeSchedulesEqual()
{
  return MEMORY[0x1E0DC5D60]();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x1E0DC5D68]();
}

uint64_t UISystemFontBoldForSize()
{
  return off_1E167DD48();
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1E0CA5988](inUTI1, inUTI2);
}

uint64_t WKGetCurrentGraphicsContext()
{
  return MEMORY[0x1E0DD97B8]();
}

uint64_t WKSetCurrentGraphicsContext()
{
  return MEMORY[0x1E0DD97C0]();
}

uint64_t WebKitCreatePathWithShrinkWrappedRects()
{
  return MEMORY[0x1E0DD9800]();
}

uint64_t WebKitGetMinimumZoomFontSize()
{
  return MEMORY[0x1E0DD9808]();
}

uint64_t WebThreadCallDelegate()
{
  return MEMORY[0x1E0DD9838]();
}

uint64_t WebThreadCallDelegateAsync()
{
  return MEMORY[0x1E0DD9840]();
}

uint64_t WebThreadIsCurrent()
{
  return MEMORY[0x1E0DD9848]();
}

uint64_t WebThreadIsEnabled()
{
  return MEMORY[0x1E0DD9850]();
}

uint64_t WebThreadIsLocked()
{
  return MEMORY[0x1E0DD9858]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x1E0DD9860]();
}

uint64_t WebThreadLockFromAnyThread()
{
  return MEMORY[0x1E0DD9868]();
}

uint64_t WebThreadMakeNSInvocation()
{
  return MEMORY[0x1E0DD9870]();
}

uint64_t WebThreadNotCurrent()
{
  return MEMORY[0x1E0DD9878]();
}

uint64_t WebThreadRun()
{
  return MEMORY[0x1E0DD9880]();
}

uint64_t WebThreadRunOnMainThread()
{
  return MEMORY[0x1E0DD9888]();
}

uint64_t WebThreadUnlockFromAnyThread()
{
  return MEMORY[0x1E0DD9890]();
}

uint64_t XCTTargetBootstrap()
{
  return MEMORY[0x1E0DDA140]();
}

uint64_t _AXDarkenSystemColors()
{
  return MEMORY[0x1E0DDD4A0]();
}

uint64_t _AXSAccessibilityBundlesPath()
{
  return MEMORY[0x1E0DDD4C8]();
}

uint64_t _AXSAccessibilityEnabled()
{
  return MEMORY[0x1E0DDD4D0]();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  return MEMORY[0x1E0DDD530]();
}

uint64_t _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled()
{
  return MEMORY[0x1E0DDD540]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x1E0DDD550]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x1E0DDD558]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1E0DDD560]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x1E0DDD588]();
}

uint64_t _AXSButtonShapesEnabled()
{
  return MEMORY[0x1E0DDD648]();
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1E0DDD660]();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return MEMORY[0x1E0DDD698]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryName()
{
  return MEMORY[0x1E0DDD6B0]();
}

uint64_t _AXSDifferentiateWithoutColorEnabled()
{
  return MEMORY[0x1E0DDD6D8]();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x1E0DDD6F8]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1E0DDD710]();
}

uint64_t _AXSExtendedKeyboardPredictionsEnabled()
{
  return MEMORY[0x1E0DDD730]();
}

uint64_t _AXSForceTouchEnabled()
{
  return MEMORY[0x1E0DDD748]();
}

uint64_t _AXSForceTouchSensitivity()
{
  return MEMORY[0x1E0DDD750]();
}

uint64_t _AXSForceTouchTimeDuration()
{
  return MEMORY[0x1E0DDD758]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x1E0DDD760]();
}

uint64_t _AXSFullKeyboardAccessPassthroughModeEnabled()
{
  return MEMORY[0x1E0DDD768]();
}

uint64_t _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation()
{
  return MEMORY[0x1E0DDD778]();
}

uint64_t _AXSGrayscaleEnabled()
{
  return MEMORY[0x1E0DDD788]();
}

uint64_t _AXSHearingDevicePairedEars()
{
  return MEMORY[0x1E0DDD7F0]();
}

uint64_t _AXSHighContrastFocusIndicatorsEnabled()
{
  return MEMORY[0x1E0DDD810]();
}

uint64_t _AXSIncreaseButtonLegibility()
{
  return MEMORY[0x1E0DDD990]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x1E0DDD9A0]();
}

uint64_t _AXSKeyRepeatDelay()
{
  return MEMORY[0x1E0DDD9D8]();
}

uint64_t _AXSKeyRepeatEnabled()
{
  return MEMORY[0x1E0DDD9E0]();
}

uint64_t _AXSKeyRepeatInterval()
{
  return MEMORY[0x1E0DDD9E8]();
}

uint64_t _AXSLowercaseKeyboardDisplayEnabled()
{
  return MEMORY[0x1E0DDDA48]();
}

uint64_t _AXSMonoAudioEnabled()
{
  return MEMORY[0x1E0DDDA50]();
}

uint64_t _AXSNamedSingleSystemColor()
{
  return MEMORY[0x1E0DDDA78]();
}

uint64_t _AXSPointerAllowAppCustomizationEnabled()
{
  return MEMORY[0x1E0DDDAB0]();
}

uint64_t _AXSPointerEffectScalingEnabled()
{
  return MEMORY[0x1E0DDDAB8]();
}

uint64_t _AXSPreferredFontSize()
{
  return MEMORY[0x1E0DDDAC8]();
}

uint64_t _AXSProcessDrawsAssistiveUI()
{
  return MEMORY[0x1E0DDDAE0]();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return MEMORY[0x1E0DDDAF0]();
}

uint64_t _AXSReduceMotionAutoplayVideoPreviewsEnabled()
{
  return MEMORY[0x1E0DDDB18]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x1E0DDDB20]();
}

uint64_t _AXSReduceMotionReduceSlideTransitionsEnabled()
{
  return MEMORY[0x1E0DDDB38]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x1E0DDDB48]();
}

uint64_t _AXSShakeToUndoDisabled()
{
  return MEMORY[0x1E0DDDCC8]();
}

uint64_t _AXSSingleSystemColorValues()
{
  return MEMORY[0x1E0DDDCE0]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x1E0DDDD08]();
}

uint64_t _AXSUseDarkerKeyboard()
{
  return MEMORY[0x1E0DDDD80]();
}

uint64_t _AXSUseSingleSystemColor()
{
  return MEMORY[0x1E0DDDD88]();
}

uint64_t _AXSVisualAlertEnabled()
{
  return MEMORY[0x1E0DDDD90]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1E0DDDDE0]();
}

uint64_t _AXSWatchControlEnabled()
{
  return MEMORY[0x1E0DDDEC0]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x1E0DDDED8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFAppVersionCheck()
{
  return MEMORY[0x1E0C99ED8]();
}

uint64_t _CFGetProductName()
{
  return MEMORY[0x1E0C9A1B8]();
}

uint64_t _CFRunLoopSetPerCalloutAutoreleasepoolEnabled()
{
  return MEMORY[0x1E0C9A488]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A628]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1E0C9A718]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1E0C9A748]();
}

uint64_t _CVCDiffableDataSourceInitializeWithUpdateItemClass()
{
  return off_1E167E1B0();
}

uint64_t _GSEventGetGSEventRecord()
{
  return MEMORY[0x1E0D27C88]();
}

void *_MXSignpostMetricsSnapshot(void)
{
  return (void *)MEMORY[0x1E0D97658]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0D15708](commaSeparatedKeysString, firstValue);
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1E0CB3BF8]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSObject()
{
  return MEMORY[0x1E0C9A898]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

uint64_t _UIDiffableDataSourceApplyDeleteUpdate()
{
  return off_1E167E220();
}

uint64_t _UIDiffableDataSourceApplyInsertUpdate()
{
  return off_1E167E228();
}

uint64_t _UIDiffableDataSourceApplyMoveUpdate()
{
  return off_1E167E230();
}

uint64_t _UIDiffableDataSourceValidateIdentifiers()
{
  return off_1E167E238();
}

uint64_t _UIDiffableDataSourceValidateIdentifiersForDiff()
{
  return off_1E167E240();
}

uint64_t _UISSetSystemReferenceAngleDataSource()
{
  return MEMORY[0x1E0DC5D80]();
}

uint64_t _UISStringForSystemReferenceAngleMode()
{
  return MEMORY[0x1E0DC5D88]();
}

uint64_t _UISTouchAuthenticationTelemetryReportRecord()
{
  return MEMORY[0x1E0DC5D90]();
}

uint64_t _UISVisibilityEnvironmentForSceneIdentityTokenString()
{
  return MEMORY[0x1E0DC5D98]();
}

uint64_t _UISVisibilityEnvironmentForUIHostedWindowContextID()
{
  return MEMORY[0x1E0DC5DA0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E167E2D0(__p);
}

uint64_t operator delete()
{
  return off_1E167E2D8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E167E2E0(__sz);
}

uint64_t operator new()
{
  return off_1E167E2E8();
}

uint64_t __CVCForceCastToSnapshotImpl()
{
  return off_1E167E2F0();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _class_setCustomDeallocInitiation()
{
  return MEMORY[0x1E0DE7940]();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1E0C80E68](*(_QWORD *)&image_index);
}

void _exit(int a1)
{
  MEMORY[0x1E0C80F80](*(_QWORD *)&a1);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

uint64_t _objc_rootIsDeallocating()
{
  return MEMORY[0x1E0DE7A00]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1E0C810C8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sandbox_in_a_container()
{
  return MEMORY[0x1E0C81198]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint64_t alm_app_did_activate()
{
  return MEMORY[0x1E0DE3B90]();
}

uint64_t alm_app_did_present_with_metrics_payload()
{
  return MEMORY[0x1E0DE3B98]();
}

uint64_t alm_app_extended_launch_end_with_details()
{
  return MEMORY[0x1E0DE3BA0]();
}

uint64_t alm_execute_when_measurement_complete()
{
  return MEMORY[0x1E0DE3BC8]();
}

uint64_t alm_legacy_app_regular_or_extended_launch_end()
{
  return MEMORY[0x1E0DE3BD0]();
}

uint64_t alm_stop_tracking_responsive_launch()
{
  return MEMORY[0x1E0DE3BD8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

uint64_t bls_scenes_log()
{
  return MEMORY[0x1E0D00FD0]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t catlas_dset_NEWLAPACK()
{
  return MEMORY[0x1E0C8BAD0]();
}

uint64_t cblas_dcopy_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB30]();
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB50]();
}

uint64_t cblas_dgemv_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB60]();
}

uint64_t cblas_dnrm2_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB68]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1E0DE7A70](cls, outCount);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x1E0DE7AE8](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1E0DE7AF8](cls, sel);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

long double cosh(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B50](__x);
  return result;
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD18]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD28]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

uint64_t dlaswp_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD40]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dtrtrs_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD80]();
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1E0C830B8]();
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1E0C830F8]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

uint64_t entr_act_begin()
{
  return MEMORY[0x1E0DE57F0]();
}

uint64_t entr_act_end()
{
  return MEMORY[0x1E0DE57F8]();
}

uint64_t entr_act_modify()
{
  return MEMORY[0x1E0DE5800]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C832B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

pid_t fork(void)
{
  return MEMORY[0x1E0C83468]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

pid_t getppid(void)
{
  return MEMORY[0x1E0C83768]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

void glBindBuffer(GLenum target, GLuint buffer)
{
  MEMORY[0x1E0CD0978](*(_QWORD *)&target, *(_QWORD *)&buffer);
}

void glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x1E0CD09A0](red, green, blue, alpha);
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
  MEMORY[0x1E0CD09B8](*(_QWORD *)&sfactor, *(_QWORD *)&dfactor);
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
  MEMORY[0x1E0CD09C8](*(_QWORD *)&target, size, data, *(_QWORD *)&usage);
}

void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data)
{
  MEMORY[0x1E0CD09D0](*(_QWORD *)&target, offset, size, data);
}

void glClear(GLbitfield mask)
{
  MEMORY[0x1E0CD09E0](*(_QWORD *)&mask);
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x1E0CD09E8](red, green, blue, alpha);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
  MEMORY[0x1E0CD0A30](*(_QWORD *)&n, buffers);
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x1E0CD0AA0](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x1E0CD0AC0](*(_QWORD *)&index);
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
  MEMORY[0x1E0CD0B00](*(_QWORD *)&n, buffers);
}

void glLineWidth(GLfloat width)
{
  MEMORY[0x1E0CD0BC8](width);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x1E0CD0D08](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

uint64_t ilaenv_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD90]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B28](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B38](v);
}

uint64_t kac_get_log()
{
  return MEMORY[0x1E0DBEB50]();
}

uint64_t kace_get_log()
{
  return MEMORY[0x1E0DBEB58]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x1E0C83A28]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  MEMORY[0x1E0C83FA8](zone, stats);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x1E0DE7B40](m, *(_QWORD *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x1E0DE7B48](m);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

uint64_t mk_timer_arm_leeway()
{
  return MEMORY[0x1E0C84140]();
}

uint64_t mk_timer_cancel()
{
  return MEMORY[0x1E0C84148]();
}

uint64_t mk_timer_create()
{
  return MEMORY[0x1E0C84150]();
}

uint64_t mk_timer_destroy()
{
  return MEMORY[0x1E0C84158]();
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

float modff(float a1, float *a2)
{
  float result;

  MEMORY[0x1E0C841E8](a2, a1);
  return result;
}

long double nextafter(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C843A8](__x, __y);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7BC8](name);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  return MEMORY[0x1E0DE7CB8](buffer, *(_QWORD *)&bufferCount);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CC8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D28](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_registerProtocol(Protocol *proto)
{
  MEMORY[0x1E0DE7D70](proto);
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FC0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1E0DE8018](a1, a2);
}

uint64_t object_getMethodImplementation()
{
  return MEMORY[0x1E0DE8020]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x1E0C84AE8](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C84B28](a1, a2);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1E0C84C88]();
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1E0DE8058](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
  MEMORY[0x1E0DE8078](proto, addition);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1E0C84F78]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C850A8](__x, __y);
  return result;
}

long double remquo(long double __x, long double __y, int *__z)
{
  long double result;

  MEMORY[0x1E0C850F8](__z, __x, __y);
  return result;
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

int sched_yield(void)
{
  return MEMORY[0x1E0C85270]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x1E0C85428](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf_l(const char *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1E0C854A0](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBC8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEDF0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1E0DEEE10]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1E0DEEE68]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

mach_port_name_t task_self_trap(void)
{
  return MEMORY[0x1E0C85888]();
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1E0C858A0](*(_QWORD *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x1E0DE5960](*(_QWORD *)&c);
}

void u_versionToString(const UVersionInfo versionArray, char *versionString)
{
  MEMORY[0x1E0DE5B38](versionArray, versionString);
}

uint64_t ucal_getCanonicalTimeZoneID()
{
  return MEMORY[0x1E0DE5D48]();
}

uint64_t uldn_localeDisplayName()
{
  return MEMORY[0x1E0DE6318]();
}

uint64_t uldn_openForContext()
{
  return MEMORY[0x1E0DE6328]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1E0DE6388]();
}

uint64_t uloc_getCharacterOrientation()
{
  return MEMORY[0x1E0DE63B8]();
}

uint64_t ulocdata_getCLDRVersion()
{
  return MEMORY[0x1E0DE6490]();
}

uint64_t uscript_getCode()
{
  return MEMORY[0x1E0DE6880]();
}

uint64_t uscript_hasScript()
{
  return MEMORY[0x1E0DE68B0]();
}

uint64_t uset_contains()
{
  return MEMORY[0x1E0DE6998]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_distancesqD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0C0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0E0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1B8](__A, __I, __C, __N);
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C228](__A, __IA, __C, __N);
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C378](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vdivD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C450](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vmaxD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6C8](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vminD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6E8](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C748](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C868](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmaD(const double *__A, vDSP_Stride __IA, const double *__B, const double *__C, vDSP_Stride __IC, double *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C890](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmsbD(const double *__A, vDSP_Stride __IA, const double *__B, const double *__C, vDSP_Stride __IC, double *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8B8](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E8](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C950](__B, __IB, __A, __IA, __C, __IC, __N);
}

vImage_Error vImageBoxConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CBB8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC00](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC28](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanar8(const vImage_Buffer *srcARGB, const vImage_Buffer *destA, const vImage_Buffer *destR, const vImage_Buffer *destG, const vImage_Buffer *destB, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CEA0](srcARGB, destA, destR, destG, destB, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGBFFFFtoPlanarF(const vImage_Buffer *srcARGB, const vImage_Buffer *destA, const vImage_Buffer *destR, const vImage_Buffer *destG, const vImage_Buffer *destB, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CED8](srcARGB, destA, destR, destG, destB, *(_QWORD *)&flags);
}

vImage_Error vImageHistogramCalculation_Planar8(const vImage_Buffer *src, vImagePixelCount *histogram, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D300](src, histogram, *(_QWORD *)&flags);
}

vImage_Error vImageHistogramCalculation_PlanarF(const vImage_Buffer *src, vImagePixelCount *histogram, unsigned int histogram_entries, Pixel_F minVal, Pixel_F maxVal, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D308](src, histogram, *(_QWORD *)&histogram_entries, *(_QWORD *)&flags, minVal, maxVal);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D410](src, dest, matrix, *(_QWORD *)&divisor, pre_bias, post_bias, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D6E8](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageTentConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D790](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageTentConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D798](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

void vvceil(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8D930](a1, a2, a3);
}

void vvfloor(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8DA08](a1, a2, a3);
}

void vvremainder(double *a1, const double *a2, const double *a3, const int *a4)
{
  MEMORY[0x1E0C8DB00](a1, a2, a3, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t work_interval_create()
{
  return MEMORY[0x1E0C85CD8]();
}

uint64_t work_interval_instance_alloc()
{
  return MEMORY[0x1E0C85CE8]();
}

uint64_t work_interval_instance_clear()
{
  return MEMORY[0x1E0C85CF0]();
}

uint64_t work_interval_instance_finish()
{
  return MEMORY[0x1E0C85CF8]();
}

uint64_t work_interval_instance_set_complexity()
{
  return MEMORY[0x1E0C85D08]();
}

uint64_t work_interval_instance_set_deadline()
{
  return MEMORY[0x1E0C85D10]();
}

uint64_t work_interval_instance_set_finish()
{
  return MEMORY[0x1E0C85D18]();
}

uint64_t work_interval_instance_set_start()
{
  return MEMORY[0x1E0C85D20]();
}

uint64_t work_interval_instance_start()
{
  return MEMORY[0x1E0C85D28]();
}

uint64_t work_interval_instance_update()
{
  return MEMORY[0x1E0C85D30]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_copy_bundle_id()
{
  return MEMORY[0x1E0C85F70]();
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1E0C860A8]();
}

uint64_t xpc_copy_bootstrap()
{
  return MEMORY[0x1E0C860F0]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

