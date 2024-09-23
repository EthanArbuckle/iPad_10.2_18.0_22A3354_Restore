@implementation INIntentResponse(Workflow)

- (void)wf_getOutputValueWithCompletionHandler:()Workflow
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("INIntentResponse+Workflow.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(a1, "_codableDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "WFEnforceClass";
      v22 = 2114;
      v23 = v8;
      v24 = 2114;
      v25 = (id)objc_opt_class();
      v26 = 2114;
      v27 = v7;
      v11 = v25;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  objc_msgSend(v9, "outputAttribute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "propertyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valueForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __69__INIntentResponse_Workflow__wf_getOutputValueWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E7AF6C28;
      v19 = v5;
      v18 = v13;
      objc_msgSend(v15, "wf_transformValueForCodableAttribute:completionHandler:", v18, v17);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

@end
