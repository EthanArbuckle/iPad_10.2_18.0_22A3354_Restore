@implementation NSObject

void __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("NSObject+WFCodableAttributeTransformable.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF773BA0))
  {
    v7 = a1[5];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_2;
    v9[3] = &unk_1E7AF6BD8;
    v10 = v6;
    objc_msgSend(v5, "wf_transformUsingCodableAttribute:completionHandler:", v7, v9);

  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v5);
  }

}

void __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF773BA0))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_4;
    v8[3] = &unk_1E7AF6C28;
    v10 = v6;
    v9 = v5;
    (*(void (**)(uint64_t, id, _QWORD *))(v7 + 16))(v7, v9, v8);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v6 + 2))(v6, v5, 0);
  }

}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF773BA0))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_7;
    v9[3] = &unk_1E7AF6C28;
    v11 = v7;
    v10 = v6;
    (*(void (**)(uint64_t, id, _QWORD *))(v8 + 16))(v8, v10, v9);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, a2, 0);
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, a2, 0);
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
