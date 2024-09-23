@implementation WFContactFieldEntry(ParameterState)

- (id)initWithSerializedRepresentation:()ParameterState variableProvider:parameter:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a1 = (id)objc_msgSend(a1, "initWithHandleString:", v4);
    v5 = a1;
  }
  else
  {
    v6 = objc_opt_class();
    WFEnforceClass(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("EntryType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      WFEnforceClass(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_msgSend(v11, "integerValue");
        objc_msgSend(v8, "objectForKey:", CFSTR("SerializedEntry"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v17 = v14;

        switch(v12)
        {
          case 1:
            objc_msgSend(MEMORY[0x1E0D14048], "objectWithWFSerializedRepresentation:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(a1, "initWithPhoneNumber:", v18);
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D13F58], "objectWithWFSerializedRepresentation:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(a1, "initWithEmailAddress:", v18);
            break;
          case 3:
            objc_msgSend(v8, "objectForKey:", CFSTR("SerializedEntry"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_opt_class();
            WFEnforceClass(v20, v21);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = (void *)objc_msgSend(a1, "initWithCustomHandle:", v18);
            break;
          case 4:
            objc_msgSend(MEMORY[0x1E0D14008], "objectWithWFSerializedRepresentation:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(a1, "initWithMessageGroup:", v18);
            break;
          default:
            goto LABEL_15;
        }
        a1 = v19;

        v5 = a1;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0D13E68];
        v23 = *MEMORY[0x1E0D142D8];
        v24[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectWithWFSerializedRepresentation:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          a1 = (id)objc_msgSend(a1, "initWithContact:", v17);
          v5 = a1;
        }
        else
        {
LABEL_15:
          v5 = 0;
        }
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)serializedRepresentation
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "type"))
  {
    objc_msgSend(a1, "underlyingObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF735D20))
    {
      objc_msgSend(v2, "wfSerializedRepresentation");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = v2;
    }
    v4 = v3;
    if (v3)
    {
      v8[0] = CFSTR("EntryType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[1] = CFSTR("SerializedEntry");
      v9[0] = v6;
      v9[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "contact");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "wfSerializedRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D142D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)processWithContext:()ParameterState userInputRequiredHandler:valueHandler:
{
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v7 = a5;
  objc_msgSend(a1, "underlyingObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a5)[2](v7, v8, 0);

}

- (uint64_t)containedVariables
{
  return MEMORY[0x1E0C9AA60];
}

@end
