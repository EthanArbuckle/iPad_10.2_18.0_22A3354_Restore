@implementation UIViewProgressAnimatableProperty

- (void)__swift_configureWithAction:(id)a3
{
  void *v4;
  uint64_t v5;
  UIViewProgressAnimatableProperty *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1857157C4((uint64_t)sub_1855A956C, v5);

  swift_release();
}

+ (id)progressAnimatablePropertyByPerforming:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "__swift_configureWithAction:", v3);
  }
  else
  {
    +[UIView _collectedViewPropertiesByPerforming:]((uint64_t)UIView, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke;
    v17[3] = &unk_1E16B1B28;
    v18 = v4;
    v12 = v7;
    v13 = 3221225472;
    v14 = __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_4;
    v15 = &unk_1E16B1B28;
    v8 = v18;
    v16 = v8;
    +[UIView _createTransformerWithProgressAnimatableProperty:modelValueSetter:presentationValueSetter:]((uint64_t)UIView, v8, v17, &v12);
    objc_msgSend(v8, "transformer", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCapturedProperties:", v6);

    objc_msgSend(v8, "transformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClearsCapturesPropertiesOnStabilization:", 0);

    objc_msgSend(v8, "setValue:", 1.0);
    v5 = v8;

  }
  return v5;
}

void __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "transformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v5 = v2;
  v6 = *(id *)(a1 + 32);
  v3 = v2;
  objc_msgSend(v3, "performWithLock:", v4);

}

void __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "capturedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_3;
  v3[3] = &unk_1E16E9FA0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithEach:", v3);

}

void __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "previousValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "value");
  objc_msgSend(v10, "interpolateTo:progress:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKeyPath:", v14, v8);

}

void __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "transformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_5;
  v4[3] = &unk_1E16B1B50;
  v5 = v2;
  v6 = *(id *)(a1 + 32);
  v3 = v2;
  objc_msgSend(v3, "performWithLock:", v4);

}

void __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_5(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "capturedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_6;
  v3[3] = &unk_1E16E9FA0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithEach:", v3);

}

void __75__UIViewProgressAnimatableProperty_progressAnimatablePropertyByPerforming___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "previousValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presentationValue");
  objc_msgSend(v10, "interpolateTo:progress:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "getValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setPresentationValue:forKey:", v13, v8);

}

@end
