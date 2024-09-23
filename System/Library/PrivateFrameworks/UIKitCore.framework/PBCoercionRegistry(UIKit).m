@implementation PBCoercionRegistry(UIKit)

- (void)uikit_registerExtraCoercions
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void *, _QWORD, void *);
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  _QWORD aBlock[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;

  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", objc_opt_class(), CFSTR("com.apple.uikit.image"), &__block_literal_global_246_0);
  v2 = objc_opt_class();
  v3 = (void *)*MEMORY[0x1E0CEC580];
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", v2, v4, &__block_literal_global_248_2);

  v5 = objc_opt_class();
  v6 = (void *)*MEMORY[0x1E0CEC530];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", v5, v7, &__block_literal_global_249_3);

  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", CFSTR("com.apple.uikit.image"), objc_opt_class(), &__block_literal_global_251_0);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v70[0] = MEMORY[0x1E0C809B0];
  v10 = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_6;
  v70[3] = &unk_1E16DA428;
  v71 = &__block_literal_global_253_2;
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v8, v9, v70);

  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v10;
  v68[1] = 3221225472;
  v68[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_7;
  v68[3] = &unk_1E16DA428;
  v69 = &__block_literal_global_253_2;
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v11, objc_opt_class(), v68);

  objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v10;
  v66[1] = 3221225472;
  v66[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_8;
  v66[3] = &unk_1E16DA428;
  v67 = &__block_literal_global_253_2;
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v12, objc_opt_class(), v66);

  objc_msgSend((id)*MEMORY[0x1E0CEC4F8], "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v10;
  v64[1] = 3221225472;
  v64[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_9;
  v64[3] = &unk_1E16DA428;
  v65 = &__block_literal_global_253_2;
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v13, objc_opt_class(), v64);

  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_14;
  aBlock[3] = &unk_1E16DA550;
  v62 = &__block_literal_global_260_2;
  v63 = &__block_literal_global_257_2;
  v14 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", objc_opt_class(), CFSTR("com.apple.uikit.attributedstring"), &__block_literal_global_265_1);
  v15 = objc_opt_class();
  v16 = (void *)*MEMORY[0x1E0CEC5C8];
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *(void **)off_1E1679000;
  __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_10((uint64_t)v17, *(void **)off_1E1679000);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", v15, v17, v18);

  v19 = objc_opt_class();
  v20 = (void *)*MEMORY[0x1E0CEC590];
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = *(void **)off_1E1678FA0;
  __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_10((uint64_t)v21, *(void **)off_1E1678FA0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", v19, v21, v22);

  v23 = objc_opt_class();
  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toObjectOfClass:coercionBlock:", v23, objc_opt_class(), &__block_literal_global_268_0);
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", CFSTR("com.apple.uikit.attributedstring"), objc_opt_class(), &__block_literal_global_269_0);
  objc_msgSend(v16, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_12(v25, v56);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v24, v25, v26);

  v58 = (void *)*MEMORY[0x1E0CEC5C0];
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_class();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_20;
  v59[3] = &unk_1E16DA428;
  v60 = &__block_literal_global_260_2;
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v27, v28, v59);

  objc_msgSend(v20, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_12(v30, v57);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v29, v30, v31);

  objc_msgSend(a1, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", objc_opt_class(), CFSTR("com.apple.uikit.color"), &__block_literal_global_272_0);
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", CFSTR("com.apple.uikit.color"), objc_opt_class(), &__block_literal_global_273_0);
  v32 = (void *)*MEMORY[0x1E0CEC658];
  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)*MEMORY[0x1E0CEC4E8];
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, *(_QWORD *)off_1E16792B8, v56);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", v33, v35, v36);

  objc_msgSend(v32, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *(void **)off_1E1679008;
  v14[2](v14, *(_QWORD *)off_1E16792B8, *(void **)off_1E1679008);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", v37, v38, v40);

  objc_msgSend(v32, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)*MEMORY[0x1E0CEC630];
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, *(_QWORD *)off_1E16792B8, v57);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", v41, v43, v44);

  v45 = (void *)*MEMORY[0x1E0CEC518];
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "identifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *(_QWORD *)off_1E1678DD0;
  v14[2](v14, *(_QWORD *)off_1E1678DD0, v56);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", v46, v47, v49);

  objc_msgSend(v45, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "identifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v48, v39);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", v50, v51, v52);

  objc_msgSend(v45, "identifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "identifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v48, v57);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", v53, v54, v55);

}

@end
