@implementation NSObject(WFTransformable)

- (void)wf_transformValueForCodableAttribute:()WFTransformable completionHandler:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[5];
  id v27;
  uint64_t v28;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF6C00;
  v28 = a2;
  aBlock[4] = a1;
  v10 = v7;
  v27 = v10;
  v11 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_opt_class();
    WFEnforceClass(a1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_3;
    v24[3] = &unk_1E7AF6C50;
    v25 = v11;
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_5;
    v22[3] = &unk_1E7AF7790;
    v23 = v8;
    objc_msgSend(v13, "wf_mapAsynchronously:completionHandler:", v24, v22);

    v14 = v25;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_9;
      v16[3] = &unk_1E7AF6BD8;
      v17 = v8;
      (*((void (**)(void *, void *, _QWORD *))v11 + 2))(v11, a1, v16);
      v13 = v17;
      goto LABEL_7;
    }
    v15 = objc_opt_class();
    WFEnforceClass(a1, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_6;
    v20[3] = &unk_1E7AF8768;
    v21 = v11;
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_8;
    v18[3] = &unk_1E7AF6C78;
    v19 = v8;
    objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", v20, v18);

    v14 = v21;
  }

LABEL_7:
}

@end
