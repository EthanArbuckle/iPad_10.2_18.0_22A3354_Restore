@implementation PXSharedLibraryRequestInvitationImageForOwner

void __PXSharedLibraryRequestInvitationImageForOwner_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v34 = a2;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("SharedLibrary-20-Rounded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    PXRectWithSize();
    v32 = *(_QWORD *)(a1 + 72);
    v33 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "size");
    PXSizeMakeSquare();
    PXRectWithSizeAlignedToRectEdgesWithPadding();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "size");
    PXSizeSafeInset();
    PXRectWithSizeAlignedToRectEdgesWithPadding();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(MEMORY[0x1E0DC3830], "formatForTraitCollection:", *(_QWORD *)(a1 + 32));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v24, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __PXSharedLibraryRequestInvitationImageForOwner_block_invoke_2;
    v35[3] = &unk_1E5123428;
    v36 = v34;
    __asm { FMOV            V0.2D, #4.0 }
    v38 = _Q0;
    v39 = v33;
    v40 = v32;
    v41 = v17;
    v42 = v19;
    v43 = v21;
    v44 = v23;
    v37 = v7;
    v45 = v9;
    v46 = v11;
    v47 = v13;
    v48 = v15;
    objc_msgSend(v25, "imageWithActions:", v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __PXSharedLibraryRequestInvitationImageForOwner_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), 6.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");

  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
}

@end
