@implementation HKSPGenerateChangeSetBetweenObjects

void __HKSPGenerateChangeSetBetweenObjects_block_invoke(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = a1[4];
  v8 = a3;
  objc_msgSend(v7, "serializedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSPDeserializedObject(v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*a4)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "serializedClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HKSPDeserializedObject(v11, v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*a4 && (NAEqualObjects() & 1) == 0)
    {
      v14 = v10;
      v15 = v13;
      v13 = v15;
      if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EE7964A0))
      {
        v13 = v15;
        if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE7964A0))
        {
          HKSPGenerateChangeSetBetweenObjects(v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v14, "mutableCopy");
          HKSPApplyChangesToObject(v13, v16);

        }
      }

      objc_msgSend(a1[6], "objectForKeyedSubscript:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "isRelationshipProperty");
      v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:changedValue:originalValue:", v17, v13, v14);
      objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v18, v19);

    }
  }

}

void __HKSPGenerateChangeSetBetweenObjects_block_invoke_2(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(a1[5], "serializedClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HKSPDeserializedObject(v7, v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*a4)
    {
      objc_msgSend(a1[6], "objectForKeyedSubscript:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "isRelationshipProperty");
      v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:changedValue:originalValue:", v11, v10, 0);
      objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v12, v13);

    }
  }

}

@end
