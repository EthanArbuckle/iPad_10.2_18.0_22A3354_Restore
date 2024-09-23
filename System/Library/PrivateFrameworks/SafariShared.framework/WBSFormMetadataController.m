@implementation WBSFormMetadataController

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (WBSFormMetadataController)init
{
  WBSFormMetadataController *v2;
  WBSFormMetadataController *v3;
  WBSFormMetadataController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSFormMetadataController;
  v2 = -[WBSFormMetadataController init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void).cxx_destruct
{
  void *v3;
  void *m_table;

  objc_storeStrong((id *)&self->_cachedFormMetadata, 0);
  m_table = self->_framesToMetadataMap.m_impl.var0.m_table;
  if (m_table)
    WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::deallocateTable((uint64_t)m_table, v3);
}

+ (BOOL)convertNumber:(id)a3 toFormMetadataRequestType:(unint64_t *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v5 && a4)
  {
    v8 = objc_msgSend(v5, "unsignedIntegerValue");
    if (v8 > 1)
    {
      v7 = 0;
    }
    else
    {
      *a4 = v8;
      v7 = 1;
    }
  }

  return v7;
}

- (void)annotateForm:(double)a3 inFrame:(id)a4 withValues:(id)a5
{
  const OpaqueJSContext *v7;
  SafariShared::JSUtilities *v8;
  const char *v9;
  const OpaqueJSContext *v10;
  const OpaqueJSContext *v11;
  objc_object *v12;
  char v13[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (const OpaqueJSContext *)a5;
  v8 = (SafariShared::JSUtilities *)objc_msgSend(a4, "jsContextForMetadataControllerScriptWorld");
  v10 = v8;
  if (v8)
  {
    v11 = SafariShared::JSUtilities::globalJSObjectByName(v8, (const OpaqueJSContext *)"FormMetadataJS", v9);
    if (v11)
    {
      *(_QWORD *)v13 = JSValueMakeNumber(v10, a3);
      v14 = SafariShared::JSUtilities::translateNSToJSValue(v10, v7, v12);
      SafariShared::JSUtilities::callJSMethodWithArguments(v10, v11, (OpaqueJSValue *)"annotateFormWithID", v13, (const OpaqueJSValue *const *)2);
    }
  }

}

- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4 selectFieldAfterFilling:(id)a5
{
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:selectFieldAfterFilling:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:selectFieldAfterFilling:", a3, a4, 1, 1, a5);
}

- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4
{
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:selectFieldAfterFilling:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:selectFieldAfterFilling:", a3, a4, 1, 1, 0);
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 selectFieldAfterFilling:(id)a5
{
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:selectFieldAfterFilling:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:selectFieldAfterFilling:", a3, a4, 0, 1, a5);
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 selectFieldAfterFilling:(id)a7
{
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:", a3, a4, a5, a6, 1, a7);
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", a3, a4, a5, a6, a7, a8, 0, v8);
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 submitForm:(BOOL)a9
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", a3, a4, a5, a6, a7, a8, 0, v9);
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 fieldsToObscure:(id)a9 submitForm:(BOOL)BOOLean
{
  id v15;
  const OpaqueJSContext *v16;
  id v17;
  const OpaqueJSContext *v18;
  SafariShared::JSUtilities *v19;
  const char *v20;
  const OpaqueJSContext *v21;
  const OpaqueJSContext *v22;
  JSValueRef Undefined;
  objc_object *v24;
  objc_object *v25;
  const OpaqueJSContext *v26;
  _QWORD v27[8];

  v27[7] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (const OpaqueJSContext *)a4;
  v17 = a8;
  v18 = (const OpaqueJSContext *)a9;
  v19 = (SafariShared::JSUtilities *)objc_msgSend(v15, "jsContextForMetadataControllerScriptWorld");
  v21 = v19;
  if (v19)
  {
    v22 = SafariShared::JSUtilities::globalJSObjectByName(v19, (const OpaqueJSContext *)"FormMetadataJS", v20);
    if (v22)
    {
      Undefined = JSValueMakeUndefined(v21);
      if (objc_msgSend(v17, "length"))
        Undefined = controlObject(v15, v17);
      v27[0] = SafariShared::JSUtilities::translateNSToJSValue(v21, v16, v24);
      v27[1] = JSValueMakeBoolean(v21, a5);
      v27[2] = JSValueMakeBoolean(v21, a6);
      v27[3] = Undefined;
      v27[4] = JSValueMakeBoolean(v21, !a7);
      if (v18)
        v26 = v18;
      else
        v26 = (const OpaqueJSContext *)MEMORY[0x1E0C9AA60];
      v27[5] = SafariShared::JSUtilities::translateNSToJSValue(v21, v26, v25);
      v27[6] = JSValueMakeBoolean(v21, BOOLean);
      SafariShared::JSUtilities::callJSMethodWithArguments(v21, v22, (OpaqueJSValue *)"autoFillControlsByID", (const char *)v27, (const OpaqueJSValue *const *)7);
    }
  }

}

- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5
{
  const OpaqueJSContext *v7;
  SafariShared::JSUtilities *v8;
  const char *v9;
  SafariShared::JSUtilities *v10;
  objc_object *v11;
  const OpaqueJSContext *v12;
  char v13[8];
  JSValueRef Boolean;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (const OpaqueJSContext *)a4;
  v8 = (SafariShared::JSUtilities *)objc_msgSend(a3, "jsContextForMetadataControllerScriptWorld");
  v10 = v8;
  if (v8)
  {
    v12 = SafariShared::JSUtilities::globalJSObjectByName(v8, (const OpaqueJSContext *)"FormMetadataJS", v9);
    if (v12)
    {
      *(_QWORD *)v13 = SafariShared::JSUtilities::translateNSToJSValue(v10, v7, v11);
      Boolean = JSValueMakeBoolean(v10, a5);
      SafariShared::JSUtilities::callJSMethodWithArguments(v10, v12, (OpaqueJSValue *)"autoFillOneTimeCodeFieldsWithValue", v13, (const OpaqueJSValue *const *)2);
    }
  }

}

- (void)focusFormForStreamlinedLogin:(double)a3 inFrame:(id)a4
{
  SafariShared::JSUtilities *v5;
  const char *v6;
  const OpaqueJSContext *v7;
  JSObjectRef v8;
  const OpaqueJSContext *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = (SafariShared::JSUtilities *)objc_msgSend(a4, "jsContextForMetadataControllerScriptWorld");
  if (v5)
  {
    v7 = v5;
    v8 = SafariShared::JSUtilities::globalJSObjectByName(v5, (const OpaqueJSContext *)"FormMetadataJS", v6);
    if (v8)
    {
      v9 = v8;
      v10[0] = JSValueMakeNumber(v7, a3);
      SafariShared::JSUtilities::callJSMethodWithArguments(v7, v9, (OpaqueJSValue *)"focusFormForStreamlinedLogin", (const char *)v10, (const OpaqueJSValue *const *)1);
    }
  }
}

- (void)autoFilledField:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = 0;
  -[WBSFormMetadataController getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:](self, "getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:", v6, v7, &v11, &v10, 0);
  v8 = v11;
  v9 = v10;
  -[WBSFormMetadataController autoFilledField:inForm:inFrame:](self, "autoFilledField:inForm:inFrame:", v8, v9, v7);

}

- (void)setFormControls:(id)a3 inFrame:(id)a4 asAutoFilled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const OpaqueJSContext *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "jsContextForMetadataControllerScriptWorld");
  if (v10)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          v15 = controlObject(v9, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14));
          -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v15, v10, (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setHTMLInputElementAutofilled:", v5);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
}

- (id)fillForm:(double)a3 inFrame:(id)a4 withPassword:(id)a5 focusedFieldControlID:(id)a6
{
  const OpaqueJSContext *v9;
  const OpaqueJSContext *v10;
  SafariShared::JSUtilities *v11;
  const char *v12;
  SafariShared::JSUtilities *v13;
  const OpaqueJSContext *v14;
  objc_object *v15;
  objc_object *v16;
  const OpaqueJSContext *v17;
  const OpaqueJSValue *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v9 = (const OpaqueJSContext *)a5;
  v10 = (const OpaqueJSContext *)a6;
  v11 = (SafariShared::JSUtilities *)objc_msgSend(a4, "jsContextForMetadataControllerScriptWorld");
  v13 = v11;
  if (v11)
  {
    v14 = SafariShared::JSUtilities::globalJSObjectByName(v11, (const OpaqueJSContext *)"FormMetadataJS", v12);
    if (v14
      && (v20[0] = JSValueMakeNumber(v13, a3),
          v20[1] = SafariShared::JSUtilities::translateNSToJSValue(v13, v9, v15),
          v20[2] = SafariShared::JSUtilities::translateNSToJSValue(v13, v10, v16),
          v17 = SafariShared::JSUtilities::callJSMethodWithArguments(v13, v14, (OpaqueJSValue *)"fillFormWithPassword", (const char *)v20, (const OpaqueJSValue *const *)3), JSValueIsArray(v13, v17)))
    {
      SafariShared::JSUtilities::translateJSValueToNS(v13, v17, v18);
      v13 = (SafariShared::JSUtilities *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)fillField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  __CFString *v7;
  id v8;
  const OpaqueJSContext *v9;
  SafariShared::JSUtilities *v10;
  const char *v11;
  const OpaqueJSContext *v12;
  const OpaqueJSContext *v13;
  objc_object *v14;
  JSStringRef string;
  char v16[8];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = (const OpaqueJSContext *)a5;
  v10 = (SafariShared::JSUtilities *)objc_msgSend(v8, "jsContextForMetadataControllerScriptWorld");
  v12 = v10;
  if (v10)
  {
    v13 = SafariShared::JSUtilities::globalJSObjectByName(v10, (const OpaqueJSContext *)"FormMetadataJS", v11);
    if (v13)
    {
      SafariShared::JSUtilities::jsString(v7, &string);
      *(_QWORD *)v16 = JSValueMakeString(v12, string);
      v17 = SafariShared::JSUtilities::translateNSToJSValue(v12, v9, v14);
      if (string)
        JSStringRelease(string);
      SafariShared::JSUtilities::callJSMethodWithArguments(v12, v13, (OpaqueJSValue *)"fillFieldWithGeneratedPassword", v16, (const OpaqueJSValue *const *)2);
    }
  }

}

- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[WBSFormMetadataController setFormControls:inFrame:asAutoFilled:](self, "setFormControls:inFrame:asAutoFilled:", v8, v9, 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        -[WBSFormMetadataController clearField:inFrame:](self, "clearField:inFrame:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v9, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  v10[2](v10);
}

- (void)clearField:(id)a3 inFrame:(id)a4
{
  __CFString *v5;
  id v6;
  SafariShared::JSUtilities *v7;
  const char *v8;
  const OpaqueJSContext *v9;
  const OpaqueJSContext *v10;
  JSStringRef string;
  char v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = (SafariShared::JSUtilities *)objc_msgSend(v6, "jsContextForMetadataControllerScriptWorld");
  v9 = v7;
  if (v7)
  {
    v10 = SafariShared::JSUtilities::globalJSObjectByName(v7, (const OpaqueJSContext *)"FormMetadataJS", v8);
    if (v10)
    {
      SafariShared::JSUtilities::jsString(v5, &string);
      *(_QWORD *)v12 = JSValueMakeString(v9, string);
      if (string)
        JSStringRelease(string);
      SafariShared::JSUtilities::callJSMethodWithArguments(v9, v10, (OpaqueJSValue *)"clearField", v12, (const OpaqueJSValue *const *)1);
    }
  }

}

- (void)focusField:(id)a3 inFrame:(id)a4
{
  id v5;
  const OpaqueJSContext *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = controlObject(v5, v7);
  if (v6)
    SafariShared::JSUtilities::callJSMethodWithArguments((SafariShared::JSUtilities *)objc_msgSend(v5, "jsContextForMetadataControllerScriptWorld"), v6, (OpaqueJSValue *)"focus", 0, 0);

}

- (void)disableSpellCheckInField:(id)a3 inFrame:(id)a4
{
  const OpaqueJSContext *v5;
  SafariShared::JSUtilities *v6;
  const char *v7;
  SafariShared::JSUtilities *v8;
  objc_object *v9;
  const OpaqueJSContext *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (const OpaqueJSContext *)a3;
  v6 = (SafariShared::JSUtilities *)objc_msgSend(a4, "jsContextForMetadataControllerScriptWorld");
  v8 = v6;
  if (v6)
  {
    v10 = SafariShared::JSUtilities::globalJSObjectByName(v6, (const OpaqueJSContext *)"FormMetadataJS", v7);
    if (v10)
    {
      v11[0] = SafariShared::JSUtilities::translateNSToJSValue(v8, v5, v9);
      SafariShared::JSUtilities::callJSMethodWithArguments(v8, v10, (OpaqueJSValue *)"disableSpellCheckInFieldIfNeeded", (const char *)v11, (const OpaqueJSValue *const *)1);
    }
  }

}

- (_NSRange)selectionRangeInField:(id)a3 inFrame:(id)a4
{
  const OpaqueJSContext *v5;
  id v6;
  SafariShared::JSUtilities *v7;
  const char *v8;
  SafariShared::JSUtilities *v9;
  objc_object *v10;
  const OpaqueJSContext *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  _QWORD v24[2];
  _NSRange result;

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = (const OpaqueJSContext *)a3;
  v6 = a4;
  v7 = (SafariShared::JSUtilities *)objc_msgSend(v6, "jsContextForMetadataControllerScriptWorld");
  v9 = v7;
  if (!v7)
  {
    v11 = 0;
LABEL_9:
    v21 = 0;
    goto LABEL_16;
  }
  v11 = SafariShared::JSUtilities::globalJSObjectByName(v7, (const OpaqueJSContext *)"FormMetadataJS", v8);
  if (!v11)
    goto LABEL_9;
  v24[0] = SafariShared::JSUtilities::translateNSToJSValue(v9, v5, v10);
  v11 = SafariShared::JSUtilities::callJSMethodWithArguments(v9, v11, (OpaqueJSValue *)"selectionRangeInField", (const char *)v24, (const OpaqueJSValue *const *)1);
  if (!v11)
    goto LABEL_9;
  v12 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", JSContextGetGlobalContext(v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueWithJSValueRef:inContext:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "toInt32") == 2;

  if (v16)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "toNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "toNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v11 = (const OpaqueJSContext *)objc_msgSend(v18, "unsignedIntegerValue");
        v21 = objc_msgSend(v20, "unsignedIntegerValue");
      }
      else
      {
        v11 = 0;
        v21 = 0;
      }

    }
    else
    {
      v11 = 0;
      v21 = 0;
    }

  }
  else
  {
    v11 = 0;
    v21 = 0;
  }

LABEL_16:
  v22 = (NSUInteger)v11;
  v23 = v21;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)selectRange:(_NSRange)a3 inField:(id)a4 inFrame:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  const OpaqueJSContext *v9;
  id v10;
  void *v11;
  unsigned int *m_tableForLLDB;
  SafariShared::JSUtilities *v13;
  const char *v14;
  SafariShared::JSUtilities *v15;
  objc_object *v16;
  const OpaqueJSContext *v17;
  _QWORD v18[4];

  length = a3.length;
  location = a3.location;
  v18[3] = *MEMORY[0x1E0C80C00];
  v9 = (const OpaqueJSContext *)a4;
  v10 = a5;
  v11 = v10;
  m_tableForLLDB = self->_framesToMetadataMap.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    if (*(m_tableForLLDB - 3))
    {
      v13 = (SafariShared::JSUtilities *)objc_msgSend(v10, "jsContextForMetadataControllerScriptWorld");
      v15 = v13;
      if (v13)
      {
        v17 = SafariShared::JSUtilities::globalJSObjectByName(v13, (const OpaqueJSContext *)"FormMetadataJS", v14);
        if (v17)
        {
          v18[0] = SafariShared::JSUtilities::translateNSToJSValue(v15, v9, v16);
          v18[1] = JSValueMakeNumber(v15, (double)location);
          v18[2] = JSValueMakeNumber(v15, (double)length);
          SafariShared::JSUtilities::callJSMethodWithArguments(v15, v17, (OpaqueJSValue *)"setFormFieldSelection", (const char *)v18, (const OpaqueJSValue *const *)3);
        }
      }
    }
  }

}

- (void)replaceRange:(_NSRange)a3 inField:(id)a4 inFrame:(id)a5 withString:(id)a6 andSelectTailStartingAt:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  const OpaqueJSContext *v12;
  const OpaqueJSContext *v13;
  SafariShared::JSUtilities *v14;
  const char *v15;
  SafariShared::JSUtilities *v16;
  objc_object *v17;
  const OpaqueJSContext *v18;
  objc_object *v19;
  _QWORD v20[6];

  length = a3.length;
  location = a3.location;
  v20[5] = *MEMORY[0x1E0C80C00];
  v12 = (const OpaqueJSContext *)a4;
  v13 = (const OpaqueJSContext *)a6;
  v14 = (SafariShared::JSUtilities *)objc_msgSend(a5, "jsContextForMetadataControllerScriptWorld");
  v16 = v14;
  if (v14)
  {
    v18 = SafariShared::JSUtilities::globalJSObjectByName(v14, (const OpaqueJSContext *)"FormMetadataJS", v15);
    if (v18)
    {
      v20[0] = SafariShared::JSUtilities::translateNSToJSValue(v16, v12, v17);
      v20[1] = JSValueMakeNumber(v16, (double)location);
      v20[2] = JSValueMakeNumber(v16, (double)length);
      v20[3] = SafariShared::JSUtilities::translateNSToJSValue(v16, v13, v19);
      v20[4] = JSValueMakeNumber(v16, (double)a7);
      SafariShared::JSUtilities::callJSMethodWithArguments(v16, v18, (OpaqueJSValue *)"replaceFormFieldRangeAndSelectTail", (const char *)v20, (const OpaqueJSValue *const *)5);
    }
  }

}

- (BOOL)isFrameAnnotated:(id)a3
{
  SafariShared::JSUtilities *v3;
  const char *v4;
  SafariShared::JSUtilities *v5;
  const OpaqueJSContext *v6;
  const OpaqueJSValue *v7;
  BOOL result;

  v3 = (SafariShared::JSUtilities *)objc_msgSend(a3, "jsContextForMetadataControllerScriptWorld");
  result = v3
        && (v5 = v3,
            (v6 = SafariShared::JSUtilities::globalJSObjectByName(v3, (const OpaqueJSContext *)"FormMetadataJS", v4)) != 0)
        && (v7 = SafariShared::JSUtilities::callJSMethodWithArguments(v5, v6, (OpaqueJSValue *)"isAnyFormAnnotated", 0, 0)) != 0&& JSValueToBoolean(v5, v7);
  return result;
}

- (BOOL)isFrameOrChildAnnotated:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  if (-[WBSFormMetadataController isFrameAnnotated:](self, "isFrameAnnotated:", v4))
  {
    v5 = 1;
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__WBSFormMetadataController_isFrameOrChildAnnotated___block_invoke;
    v7[3] = &unk_1E4B3A350;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(v4, "enumerateChildFramesUsingBlock:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

void __53__WBSFormMetadataController_isFrameOrChildAnnotated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(a1 + 32), "isFrameOrChildAnnotated:");

}

- (void)clearMetadataForFrame:(id)a3
{
  id v4;
  WBSFormMetadata *cachedFormMetadata;
  unsigned int *v6;
  unsigned int *m_tableForLLDB;
  unsigned int *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;

  v4 = a3;
  cachedFormMetadata = self->_cachedFormMetadata;
  self->_cachedFormMetadata = 0;

  v11 = objc_msgSend(v4, "frameRef");
  v6 = (unsigned int *)WTF::HashTable<OpaqueJSContext *,WTF::KeyValuePair<OpaqueJSContext *,OpaqueJSWeakObjectMap *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueJSContext *,OpaqueJSWeakObjectMap *>>,WTF::DefaultHash<OpaqueJSContext *>,WTF::HashMap<OpaqueJSContext *,OpaqueJSWeakObjectMap *,WTF::DefaultHash<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSWeakObjectMap *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueJSContext *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueJSContext *,OpaqueJSWeakObjectMap *,WTF::DefaultHash<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSWeakObjectMap *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueJSContext *>>,OpaqueJSContext *>((uint64_t *)&self->_framesToMetadataMap, &v11);
  m_tableForLLDB = self->_framesToMetadataMap.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v8 = &m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
    if (v8 == v6)
      goto LABEL_12;
  }
  else
  {
    if (!v6)
      goto LABEL_12;
    v8 = 0;
  }
  if (v8 != v6)
  {
    WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::remove((uint64_t *)&self->_framesToMetadataMap, v6);
    m_tableForLLDB = self->_framesToMetadataMap.m_impl.var0.m_tableForLLDB;
  }
  if (!m_tableForLLDB || !*(m_tableForLLDB - 3))
  {
    objc_msgSend(v4, "pageMainFrame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WBSFormMetadataController isFrameOrChildAnnotated:](self, "isFrameOrChildAnnotated:", v9);

    if (!v10)
      -[WBSFormMetadataController clearScriptWorld](self, "clearScriptWorld");
  }
LABEL_12:

}

- (void)recursivelyClearMetadataForFrames:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__WBSFormMetadataController_recursivelyClearMetadataForFrames___block_invoke;
  v5[3] = &unk_1E4B3A378;
  v5[4] = self;
  objc_msgSend(v4, "enumerateChildFramesUsingBlock:", v5);
  -[WBSFormMetadataController clearMetadataForFrame:](self, "clearMetadataForFrame:", v4);

}

uint64_t __63__WBSFormMetadataController_recursivelyClearMetadataForFrames___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "recursivelyClearMetadataForFrames:", a2);
}

- (void)metadataForFrame:(id)a3 requestType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[3];

  v5 = a3;
  v10 = objc_msgSend(v5, "frameRef");
  WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::add<decltype(nullptr)>((uint64_t *)&self->_framesToMetadataMap, &v10, (uint64_t)v11);
  v6 = v11[0];
  v7 = *(void **)(v11[0] + 8);
  if (!v7)
  {
    v7 = (void *)operator new();
    SafariShared::FrameMetadata::FrameMetadata((uint64_t)v7, v5, self);
    v8 = *(_QWORD *)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v7;
    if (v8)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      v7 = *(void **)(v6 + 8);
    }
  }

  return v7;
}

- (void)recursivelyCollectMetadataInFrame:(id)a3 requestType:(unint64_t)a4 frames:(id)a5 formMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "committedURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "safari_isHTTPFamilyURL") & 1) != 0 || (objc_msgSend(v13, "isFileURL") & 1) != 0)
  {

  }
  else
  {
    v21 = objc_msgSend(v13, "safari_isDataURL");

    if (!v21)
      goto LABEL_12;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  SafariShared::FrameMetadata::metadataForAllForms((uint64_t)-[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v10, a4), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17);
        objc_msgSend(v11, "addObject:", v10);
        objc_msgSend(v12, "addObject:", v18);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

LABEL_12:
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__WBSFormMetadataController_recursivelyCollectMetadataInFrame_requestType_frames_formMetadata___block_invoke;
  v22[3] = &unk_1E4B3A3A0;
  v22[4] = self;
  v25 = a4;
  v19 = v11;
  v23 = v19;
  v20 = v12;
  v24 = v20;
  objc_msgSend(v10, "enumerateChildFramesUsingBlock:", v22);

}

uint64_t __95__WBSFormMetadataController_recursivelyCollectMetadataInFrame_requestType_frames_formMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "recursivelyCollectMetadataInFrame:requestType:frames:formMetadata:", a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)recursivelyCollectAncestorFramesOfFrame:(id)a3 startingFromFrame:(id)a4 ancestorFrames:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "frameRef");
  if (v11 == objc_msgSend(v8, "frameRef"))
  {
    objc_msgSend(v10, "addObject:", v9);
    v12 = 1;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __102__WBSFormMetadataController_recursivelyCollectAncestorFramesOfFrame_startingFromFrame_ancestorFrames___block_invoke;
    v14[3] = &unk_1E4B3A3C8;
    v14[4] = self;
    v15 = v8;
    v16 = v10;
    v18 = &v19;
    v17 = v9;
    objc_msgSend(v17, "enumerateChildFramesUsingBlock:", v14);
    v12 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v12;
}

void __102__WBSFormMetadataController_recursivelyCollectAncestorFramesOfFrame_startingFromFrame_ancestorFrames___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "recursivelyCollectAncestorFramesOfFrame:startingFromFrame:ancestorFrames:", *(_QWORD *)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
  }

}

- (void)getMetadataForAllFormsInPageWithMainFrame:(id)a3 requestType:(unint64_t)a4 frames:(id *)a5 formMetadata:(id *)a6
{
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController recursivelyCollectMetadataInFrame:requestType:frames:formMetadata:](self, "recursivelyCollectMetadataInFrame:requestType:frames:formMetadata:", v12, a4, v10, v11);
  if (a5)
    *a5 = objc_retainAutorelease(v10);
  if (a6)
    *a6 = objc_retainAutorelease(v11);

}

- (OpaqueJSValue)_jsObjectForForm:(id)a3 inFrame:(id)a4
{
  id v5;
  const OpaqueJSValue *v6;

  v5 = a4;
  v6 = (const OpaqueJSValue *)objc_msgSend(v5, "jsWrapperInMetadataControllerScriptWorldForNode:", a3);
  if (v6)
    v6 = JSValueToObject((JSContextRef)objc_msgSend(v5, "jsContextForMetadataControllerScriptWorld"), v6, 0);

  return v6;
}

- (id)metadataForForm:(id)a3 inFrame:(id)a4 requestType:(unint64_t)a5
{
  -[WBSFormMetadataController metadataForForm:inFrame:requestType:addUserEditedStateForUserNameAndPasswordFields:](self, "metadataForForm:inFrame:requestType:addUserEditedStateForUserNameAndPasswordFields:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)metadataForForm:(id)a3 inFrame:(id)a4 requestType:(unint64_t)a5 addUserEditedStateForUserNameAndPasswordFields:(BOOL)a6
{
  id v10;
  OpaqueJSValue *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v10 = a4;
  v11 = -[WBSFormMetadataController _jsObjectForForm:inFrame:](self, "_jsObjectForForm:inFrame:", a3, v10);
  if (v11)
  {
    SafariShared::FrameMetadata::metadataForForm((id *)-[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v10, a5), v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a6)
    {
      -[WBSFormMetadataController _formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata:inFrame:](self, "_formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata:inFrame:", v12, v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v12;
    }
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata:(id)a3 inFrame:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v20 = v5;
  objc_msgSend(v5, "userNameElementUniqueID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordElementUniqueID");
  v6 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v6;
  if (__PAIR128__((unint64_t)v22, v6) == 0)
  {
    v17 = v5;
  }
  else
  {
    objc_msgSend(v5, "controls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v19, "addObject:", v22);
    if (v21)
      objc_msgSend(v19, "addObject:", v21);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v19;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11);
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __132__WBSFormMetadataController__formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata_inFrame___block_invoke;
          v26[3] = &unk_1E4B39C70;
          v26[4] = v12;
          v13 = objc_msgSend(v8, "indexOfObjectPassingTest:", v26, v19);
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v14, "mutableCopy");

            -[WBSFormMetadataController formAutoFillNodeForField:inFrame:](self, "formAutoFillNodeForField:inFrame:", v12, v24);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setUserEditedTextField:", objc_msgSend(v16, "isHTMLInputElementUserEdited"));
            objc_msgSend(v8, "setObject:atIndexedSubscript:", v15, v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }

    objc_msgSend(v20, "formMetadataByReplacingControlsWith:", v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __132__WBSFormMetadataController__formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata_inFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_lockMetadataForForm:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  OpaqueJSValue *v8;
  const OpaqueJSContext *v9;
  const OpaqueJSValue *v10;
  JSStringRef propertyName;

  v6 = a3;
  v7 = a4;
  -[WBSFormMetadataController _unlockMetadataForForm:inFrame:](self, "_unlockMetadataForForm:inFrame:", v6, v7);
  v8 = -[WBSFormMetadataController _jsObjectForForm:inFrame:](self, "_jsObjectForForm:inFrame:", v6, v7);
  if (v8)
  {
    v9 = (const OpaqueJSContext *)objc_msgSend(v7, "jsContextForMetadataControllerScriptWorld");
    v10 = SafariShared::FrameMetadata::jsMetadataForForm((id *)-[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v7, 0), v8, 0);
    if (v10)
    {
      SafariShared::JSUtilities::jsString((SafariShared::JSUtilities *)"_safariLockedFormMetadata", &propertyName);
      JSObjectSetProperty(v9, v8, propertyName, v10, 0, 0);
      if (propertyName)
        JSStringRelease(propertyName);
    }
  }

}

- (void)_unlockMetadataForForm:(id)a3 inFrame:(id)a4
{
  id v6;
  OpaqueJSValue *v7;
  const OpaqueJSContext *v8;
  JSStringRef propertyName;

  v6 = a4;
  v7 = -[WBSFormMetadataController _jsObjectForForm:inFrame:](self, "_jsObjectForForm:inFrame:", a3, v6);
  if (v7)
  {
    v8 = (const OpaqueJSContext *)objc_msgSend(v6, "jsContextForMetadataControllerScriptWorld");
    SafariShared::JSUtilities::jsString((SafariShared::JSUtilities *)"_safariLockedFormMetadata", &propertyName);
    JSObjectDeleteProperty(v8, v7, propertyName, 0);
    if (propertyName)
      JSStringRelease(propertyName);
  }

}

- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 textFieldMetadata:(id *)a5 formMetadata:(id *)a6 requestType:(unint64_t)a7
{
  id v12;
  id v13;
  const OpaqueJSValue *v14;
  const OpaqueJSContext *v15;
  JSObjectRef v16;
  const char *v17;
  JSObjectRef v18;
  JSValueRef v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  WBSMutableFormControlMetadata *v25;
  WBSFormMetadata *v26;
  void *v27;
  WBSFormMetadata *cachedFormMetadata;
  WBSFormMetadata *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  WBSFormMetadata *v41;
  void *v42;
  id *v43;
  id *v44;
  void *v45;
  WBSFormMetadata *v46;
  void *v47;
  OpaqueJSContext *v48;
  SafariShared::JSUtilities *ctx;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55[128];
  char v56[8];
  JSValueRef Number;
  JSValueRef Boolean;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v50 = v12;
  -[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v13, 0);
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v14 = (const OpaqueJSValue *)objc_msgSend(v13, "jsWrapperInMetadataControllerScriptWorldForNode:", v12);
  if (!v14)
    goto LABEL_14;
  v15 = (const OpaqueJSContext *)objc_msgSend(v13, "jsContextForMetadataControllerScriptWorld");
  v16 = JSValueToObject(v15, v14, 0);
  ctx = v15;
  v18 = SafariShared::JSUtilities::globalJSObjectByName(v15, (const OpaqueJSContext *)"FormMetadataJS", v17);
  if (!v18)
    goto LABEL_14;
  v48 = v18;
  Boolean = 0;
  *(_QWORD *)v56 = v16;
  Number = JSValueMakeNumber(v15, (double)a7);
  Boolean = JSValueMakeBoolean(v15, self->_cachedFormMetadata != 0);
  v19 = SafariShared::JSUtilities::callJSMethodWithArguments(v15, v48, (OpaqueJSValue *)"textFieldOrSelectElementMetadata", v56, (const OpaqueJSValue *const *)3);
  if (!v19)
  {
LABEL_13:
    SafariShared::JSUtilities::callJSMethodWithArguments(ctx, v48, (OpaqueJSValue *)"clearTextFieldOrSelectElementMetadataCache", 0, 0);
LABEL_14:
    cachedFormMetadata = self->_cachedFormMetadata;
    self->_cachedFormMetadata = 0;

    goto LABEL_15;
  }
  v20 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", JSContextGetGlobalContext(v15));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a6;
  v44 = a5;
  objc_msgSend(v20, "valueWithJSValueRef:inContext:", v19, v21);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("length"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "toInt32") == 2;

  if (!v23
    || (objc_msgSend(v47, "objectAtIndexedSubscript:", 0),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "toDictionary"),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        !v45))
  {

    goto LABEL_13;
  }
  v25 = -[WBSFormControlMetadata initWithDictionary:]([WBSMutableFormControlMetadata alloc], "initWithDictionary:", v45);
  objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v42, "toBool") & 1) != 0)
  {
    v26 = -[WBSFormMetadata initWithJSValue:]([WBSFormMetadata alloc], "initWithJSValue:", v42);
    v27 = self->_cachedFormMetadata;
    v46 = v26;
    self->_cachedFormMetadata = v26;
  }
  else
  {
    v29 = self->_cachedFormMetadata;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v46 = v29;
    -[WBSFormMetadata controls](v29, "controls");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v52 != v31)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v33, "uniqueID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSFormControlMetadata uniqueID](v25, "uniqueID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v34 == v35;

          if (v36)
          {
            -[WBSFormControlMetadata value](v25, "value");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setValue:", v37);

          }
        }
        v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v30);
    }
  }

  SafariShared::addAdditionalControlMetadata(v25, v50);
  -[WBSMutableFormControlMetadata setUserEditedTextField:](v25, "setUserEditedTextField:", objc_msgSend(v50, "isHTMLInputElementUserEdited"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pageMainFrame");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController recursivelyCollectAncestorFramesOfFrame:startingFromFrame:ancestorFrames:](self, "recursivelyCollectAncestorFramesOfFrame:startingFromFrame:ancestorFrames:", v13, v39, v38);

  objc_msgSend(v38, "safari_mapObjectsUsingBlock:", &__block_literal_global_50);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSMutableFormControlMetadata setAncestorFrameURLs:](v25, "setAncestorFrameURLs:", v40);

  if (v44)
    *v44 = (id)-[WBSMutableFormControlMetadata copy](v25, "copy");
  if (v43)
  {
    SafariShared::addPasswordRequirementsToFormMetadata((SafariShared *)v46, v41);
    *v43 = objc_retainAutorelease(v46);
  }

LABEL_15:
}

id __104__WBSFormMetadataController_getMetadataForTextField_inFrame_textFieldMetadata_formMetadata_requestType___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "committedURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, id);
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  objc_msgSend(v9, "pageMainFrame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:](self, "getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:", v11, 0, 0, 0);

  -[WBSFormMetadataController formAutoFillNodeForField:inFrame:](self, "formAutoFillNodeForField:inFrame:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15 = 0;
    v16 = 0;
    -[WBSFormMetadataController getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:](self, "getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:", v12, v9, &v16, &v15, 0);
    v13 = v16;
    v14 = v15;
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  v10[2](v10, v14, v13);

}

- (id)uniqueIDForTextField:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  const OpaqueJSValue *v8;
  const OpaqueJSContext *v9;
  const char *v10;
  const OpaqueJSContext *v11;
  const OpaqueJSValue *v12;
  void *v13;
  char v15[8];

  v6 = a3;
  v7 = a4;
  -[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v7, 0);
  v8 = (const OpaqueJSValue *)objc_msgSend(v7, "jsWrapperInMetadataControllerScriptWorldForNode:", v6);
  if (v8
    && (v9 = (const OpaqueJSContext *)objc_msgSend(v7, "jsContextForMetadataControllerScriptWorld"),
        *(_QWORD *)v15 = JSValueToObject(v9, v8, 0),
        (v11 = SafariShared::JSUtilities::globalJSObjectByName(v9, (const OpaqueJSContext *)"FormMetadataJS", v10)) != 0)
    && (v12 = SafariShared::JSUtilities::callJSMethodWithArguments(v9, v11, (OpaqueJSValue *)"controlUniqueID", v15, (const OpaqueJSValue *const *)1)) != 0)
  {
    SafariShared::JSUtilities::toNSString(v9, v12, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)userEditedTextControlCountInArray:(OpaqueJSValue *)a3 context:(OpaqueJSContext *)a4 expectTextFieldsRatherThanTextAreas:(BOOL)a5
{
  _BOOL4 v5;
  const OpaqueJSContext *v8;
  const OpaqueJSValue **v9;
  OpaqueJSValue *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  const OpaqueJSValue *PropertyAtIndex;
  JSObjectRef v16;
  void *v17;
  void *v18;
  unsigned int v19;
  JSValueRef v21;

  if (!a3)
    return 0;
  v5 = a5;
  v8 = JSValueToObject(a4, a3, 0);
  if (!v8)
    return 0;
  v10 = v8;
  v21 = 0;
  v11 = SafariShared::JSUtilities::arrayLength(a4, v8, &v21, v9);
  v12 = 0;
  if (!v21)
  {
    v13 = v11;
    if (v11)
    {
      v14 = 0;
      v12 = 0;
      do
      {
        PropertyAtIndex = JSObjectGetPropertyAtIndex(a4, v10, v14, 0);
        if (PropertyAtIndex)
        {
          v16 = JSValueToObject(a4, PropertyAtIndex, 0);
          if (v16)
          {
            -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v16, a4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              if (v5)
                v19 = objc_msgSend(v17, "isHTMLInputElementUserEdited");
              else
                v19 = objc_msgSend(v17, "isHTMLTextAreaElementUserEdited");
              v12 += v19;
            }

          }
        }
        ++v14;
      }
      while (v13 != v14);
    }
  }
  return v12;
}

- (void)countUserEditedTextControlsInFrame:(id)a3 textFields:(unint64_t *)a4 textAreas:(unint64_t *)a5
{
  id v8;
  SafariShared::JSUtilities *v9;
  const char *v10;
  SafariShared::JSUtilities *v11;
  const OpaqueJSContext *v12;
  const OpaqueJSValue *v13;
  OpaqueJSValue *v14;
  const OpaqueJSValue **v15;
  JSValueRef v16;

  v8 = a3;
  -[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v8, 0);
  v9 = (SafariShared::JSUtilities *)objc_msgSend(v8, "jsContextForMetadataControllerScriptWorld");
  v11 = v9;
  if (v9)
  {
    v12 = SafariShared::JSUtilities::globalJSObjectByName(v9, (const OpaqueJSContext *)"FormMetadataJS", v10);
    if (v12)
    {
      v13 = SafariShared::JSUtilities::callJSMethodWithArguments(v11, v12, (OpaqueJSValue *)"visibleNonEmptyFormTextControls", 0, 0);
      if (v13)
      {
        v14 = JSValueToObject(v11, v13, 0);
        v16 = 0;
        if (SafariShared::JSUtilities::arrayLength(v11, v14, &v16, v15) == 2 && !v16)
        {
          *a4 = -[WBSFormMetadataController userEditedTextControlCountInArray:context:expectTextFieldsRatherThanTextAreas:](self, "userEditedTextControlCountInArray:context:expectTextFieldsRatherThanTextAreas:", JSObjectGetPropertyAtIndex(v11, v14, 0, 0), v11, 1);
          *a5 = -[WBSFormMetadataController userEditedTextControlCountInArray:context:expectTextFieldsRatherThanTextAreas:](self, "userEditedTextControlCountInArray:context:expectTextFieldsRatherThanTextAreas:", JSObjectGetPropertyAtIndex(v11, v14, 1u, 0), v11, 0);
        }
      }
    }
  }

}

- (void)recursivelyCountUserEditedTextControlsInFrame:(id)a3 textFields:(unint64_t *)a4 textAreas:(unint64_t *)a5
{
  id v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[WBSFormMetadataController countUserEditedTextControlsInFrame:textFields:textAreas:](self, "countUserEditedTextControlsInFrame:textFields:textAreas:", v8, &v17, &v13);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__WBSFormMetadataController_recursivelyCountUserEditedTextControlsInFrame_textFields_textAreas___block_invoke;
  v9[3] = &unk_1E4B3A430;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  objc_msgSend(v8, "enumerateChildFramesUsingBlock:", v9);
  *a4 += v15[3];
  *a5 += v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

uint64_t __96__WBSFormMetadataController_recursivelyCountUserEditedTextControlsInFrame_textFields_textAreas___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "recursivelyCountUserEditedTextControlsInFrame:textFields:textAreas:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (BOOL)pageWithMainFrameMeetsEditedFormTextWarningCriteria:(id)a3
{
  id v4;
  const OpaqueJSContext *v5;
  SafariShared *v6;
  const OpaqueJSContext *GlobalObject;
  OpaqueJSValue *v8;
  const char *v9;
  OpaqueJSValue *v10;
  const OpaqueJSValue *Property;
  OpaqueJSValue *v12;
  const OpaqueJSContext *v13;
  BOOL v14;
  BOOL v15;
  uint64_t v17;
  JSStringRef propertyName;

  v4 = a3;
  v5 = (const OpaqueJSContext *)objc_msgSend(v4, "jsContextForMetadataControllerScriptWorld");
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  GlobalObject = JSContextGetGlobalObject(v5);
  if (SafariShared::jsObjectHasOnBeforeUnloadProperty(v6, GlobalObject, v8))
    goto LABEL_7;
  v10 = SafariShared::JSUtilities::globalJSObjectByName(v6, (const OpaqueJSContext *)"document", v9);
  SafariShared::JSUtilities::jsString((SafariShared::JSUtilities *)"body", &propertyName);
  Property = JSObjectGetProperty(v6, v10, propertyName, 0);
  v13 = JSValueToObject(v6, Property, 0);
  if (propertyName)
    JSStringRelease(propertyName);
  if (v13 && SafariShared::jsObjectHasOnBeforeUnloadProperty(v6, v13, v12))
  {
LABEL_7:
    v14 = 0;
  }
  else
  {
    v17 = 0;
    propertyName = 0;
    -[WBSFormMetadataController recursivelyCountUserEditedTextControlsInFrame:textFields:textAreas:](self, "recursivelyCountUserEditedTextControlsInFrame:textFields:textAreas:", v4, &propertyName, &v17);
    -[WBSFormMetadataController recursivelyClearMetadataForFrames:](self, "recursivelyClearMetadataForFrames:", v4);
    if (v17)
      v15 = 1;
    else
      v15 = (unint64_t)propertyName > 1;
    v14 = v15;
  }

  return v14;
}

- (void)textFieldFocused:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6
{
  id v10;
  id v11;
  WBSFormControlMetadata *v12;
  WBSFormMetadata *v13;
  WBSFormControlMetadata *v14;
  WBSFormMetadata *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = (WBSFormControlMetadata *)a5;
  v13 = (WBSFormMetadata *)a6;
  v30 = objc_msgSend(v11, "frameRef");
  if (!WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::contains<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueFormAutoFillFrame *>>,OpaqueFormAutoFillFrame *>((uint64_t *)&self->_framesToMetadataMap, &v30))
  {
    v18 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WBSFormMetadataController textFieldFocused:inFrame:textFieldMetadata:formMetadata:].cold.1(v18);
    goto LABEL_17;
  }
  if (-[WBSFormControlMetadata isSecureTextField](v12, "isSecureTextField"))
  {
    getField(self, v12, v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = v13;
    v16 = -[WBSFormMetadata type](v15, "type");
    if ((unint64_t)(v16 - 6) < 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = 0;
LABEL_12:

      -[WBSFormMetadataController passwordFieldFocused:inFrame:textFieldMetadata:formMetadata:isPasswordFieldForUserCredentials:](self, "passwordFieldFocused:inFrame:textFieldMetadata:formMetadata:isPasswordFieldForUserCredentials:", v29, v11, v14, v15, v17);
      goto LABEL_13;
    }
    -[WBSFormControlMetadata uniqueID](v14, "uniqueID");
    v28 = objc_claimAutoreleasedReturnValue();
    -[WBSFormMetadata oldPasswordElementUniqueID](v15, "oldPasswordElementUniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v28);

    if ((v20 & 1) != 0
      || (-[WBSFormMetadata passwordElementUniqueID](v15, "passwordElementUniqueID"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isEqualToString:", v28),
          v21,
          (v22 & 1) != 0))
    {
      v17 = 1;
    }
    else
    {
      if (v16 != 3)
      {
        v23 = (void *)v28;
        -[WBSFormMetadata confirmPasswordElementUniqueID](v15, "confirmPasswordElementUniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v27, "isEqualToString:", v28);

        goto LABEL_11;
      }
      v17 = 0;
    }
    v23 = (void *)v28;
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  if (-[WBSFormControlMetadata looksLikeCreditCardNumberField](v12, "looksLikeCreditCardNumberField")
    || -[WBSFormControlMetadata looksLikeCreditCardCardholderField](v12, "looksLikeCreditCardCardholderField")
    || -[WBSFormControlMetadata looksLikeCreditCardSecurityCodeField](v12, "looksLikeCreditCardSecurityCodeField"))
  {
    -[WBSFormMetadataController creditCardFieldFocused:inFrame:](self, "creditCardFieldFocused:inFrame:", v10, v11);
  }
  else
  {
    if (!isUsernameFieldInLoginForm(v12, v13))
    {
      -[WBSFormControlMetadata addressBookLabel](v12, "addressBookLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (v26
        && -[WBSFormMetadataController addressBookAutoFillableFieldFocused:withAddressBookAutoFillableFieldMetadata:formMetadata:inFrame:](self, "addressBookAutoFillableFieldFocused:withAddressBookAutoFillableFieldMetadata:formMetadata:inFrame:", v10, v12, v13, v11))
      {
        if (!-[WBSFormControlMetadata looksLikeOneTimeCodeField](v12, "looksLikeOneTimeCodeField"))
          goto LABEL_17;
      }
      else
      {
        if (-[WBSFormControlMetadata looksLikeCreditCardSecurityCodeField](v12, "looksLikeCreditCardSecurityCodeField")
          || -[WBSFormControlMetadata looksLikeCreditCardCompositeExpirationDateField](v12, "looksLikeCreditCardCompositeExpirationDateField")|| -[WBSFormControlMetadata looksLikeCreditCardTypeField](v12, "looksLikeCreditCardTypeField"))
        {
          -[WBSFormMetadataController otherCreditCardFieldFocused:inFrame:textFieldMetadata:formMetadata:](self, "otherCreditCardFieldFocused:inFrame:textFieldMetadata:formMetadata:", v10, v11, v12, v13);
          goto LABEL_17;
        }
        if (!-[WBSFormControlMetadata looksLikeOneTimeCodeField](v12, "looksLikeOneTimeCodeField"))
        {
          -[WBSFormMetadataController unidentifiedTextFieldFocused:inFrame:textFieldMetadata:formMetadata:](self, "unidentifiedTextFieldFocused:inFrame:textFieldMetadata:formMetadata:", v10, v11, v12, v13);
          goto LABEL_17;
        }
      }
      -[WBSFormMetadataController oneTimeCodeFieldFocused:withFieldMetadata:formMetadata:inFrame:](self, "oneTimeCodeFieldFocused:withFieldMetadata:formMetadata:inFrame:", v10, v12, v13, v11);
      goto LABEL_17;
    }
    getField(self, v12, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormMetadataController usernameFieldFocused:fieldMetadata:inForm:inFrame:](self, "usernameFieldFocused:fieldMetadata:inForm:inFrame:", v24, v12, v13, v11);

  }
LABEL_17:

}

- (void)textFieldBlurred:(id)a3 inFrame:(id)a4 page:(id)a5 textFieldMetadata:(id)a6 formMetadata:(id)a7
{
  id v12;
  id v13;
  WBSFormControlMetadata *v14;
  WBSFormMetadata *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (WBSFormControlMetadata *)a6;
  v15 = (WBSFormMetadata *)a7;
  if (-[WBSFormControlMetadata isSecureTextField](v14, "isSecureTextField"))
  {
    -[WBSFormMetadataController passwordFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:](self, "passwordFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:", v18, v12, v13, v14, v15);
  }
  else if (-[WBSFormControlMetadata looksLikeCreditCardNumberField](v14, "looksLikeCreditCardNumberField")
         || -[WBSFormControlMetadata looksLikeCreditCardCardholderField](v14, "looksLikeCreditCardCardholderField")
         || -[WBSFormControlMetadata looksLikeCreditCardSecurityCodeField](v14, "looksLikeCreditCardSecurityCodeField"))
  {
    -[WBSFormMetadataController creditCardFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:](self, "creditCardFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:", v18, v12, v13, v14, v15);
  }
  else
  {
    if (!isUsernameFieldInLoginForm(v14, v15))
    {
      -[WBSFormControlMetadata addressBookLabel](v14, "addressBookLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        -[WBSFormMetadataController addressBookAutoFillableFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:](self, "addressBookAutoFillableFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:", v18, v12, v13, v14, v15);
        if (!-[WBSFormControlMetadata looksLikeOneTimeCodeField](v14, "looksLikeOneTimeCodeField"))
          goto LABEL_7;
      }
      else
      {
        if (-[WBSFormControlMetadata looksLikeCreditCardSecurityCodeField](v14, "looksLikeCreditCardSecurityCodeField")
          || -[WBSFormControlMetadata looksLikeCreditCardCompositeExpirationDateField](v14, "looksLikeCreditCardCompositeExpirationDateField")|| -[WBSFormControlMetadata looksLikeCreditCardTypeField](v14, "looksLikeCreditCardTypeField"))
        {
          -[WBSFormMetadataController otherCreditCardFieldBlurred:inFrame:textFieldMetadata:formMetadata:](self, "otherCreditCardFieldBlurred:inFrame:textFieldMetadata:formMetadata:", v18, v12, v14, v15);
          goto LABEL_7;
        }
        if (!-[WBSFormControlMetadata looksLikeOneTimeCodeField](v14, "looksLikeOneTimeCodeField"))
        {
          -[WBSFormMetadataController unidentifiedTextFieldBlurred:inFrame:textFieldMetadata:formMetadata:](self, "unidentifiedTextFieldBlurred:inFrame:textFieldMetadata:formMetadata:", v18, v12, v14, v15);
          goto LABEL_7;
        }
      }
      -[WBSFormMetadataController oneTimeCodeFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:](self, "oneTimeCodeFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:", v18, v12, v13, v14, v15);
      goto LABEL_7;
    }
    -[WBSFormMetadataController usernameFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:](self, "usernameFieldBlurred:inFrame:page:textFieldMetadata:formMetadata:", v18, v12, v13, v14, v15);
  }
LABEL_7:

}

- (id)formElementWithFormID:(double)a3 inFrame:(id)a4
{
  SafariShared::JSUtilities *Number;
  const char *v7;
  const OpaqueJSContext *v8;
  const OpaqueJSContext *v9;
  char v11[8];

  Number = (SafariShared::JSUtilities *)objc_msgSend(a4, "jsContextForMetadataControllerScriptWorld");
  if (Number)
  {
    v8 = Number;
    Number = SafariShared::JSUtilities::globalJSObjectByName(Number, (const OpaqueJSContext *)"FormMetadataJS", v7);
    if (Number)
    {
      v9 = Number;
      Number = JSValueMakeNumber(v8, a3);
      *(_QWORD *)v11 = Number;
      if (Number)
      {
        Number = SafariShared::JSUtilities::callJSMethodWithArguments(v8, v9, (OpaqueJSValue *)"formElementWithFormID", v11, (const OpaqueJSValue *const *)1);
        if (Number)
        {
          -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", JSValueToObject(v8, Number, 0), v8);
          Number = (SafariShared::JSUtilities *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return Number;
}

- (BOOL)addressBookAutoFillableFieldFocused:(id)a3 withAddressBookAutoFillableFieldMetadata:(id)a4 formMetadata:(id)a5 inFrame:(id)a6
{
  return 1;
}

- (BOOL)autoFillFrameIsValid:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "frameRef");
  if (v7)
    v5 = WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::contains<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueFormAutoFillFrame *>>,OpaqueFormAutoFillFrame *>((uint64_t *)&self->_framesToMetadataMap, &v7);
  else
    v5 = 0;

  return v5;
}

- (id)formAutoFillNodeForJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  return 0;
}

- (id)formAutoFillNodeForField:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend(v7, "frameRef");
  if (WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::contains<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueFormAutoFillFrame *>>,OpaqueFormAutoFillFrame *>((uint64_t *)&self->_framesToMetadataMap, &v10))
  {
    -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", controlObject(v7, v6), objc_msgSend(v7, "jsContextForMetadataControllerScriptWorld"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formSubmissionURLStringForSearchTextField:(id)a3 inFrame:(id)a4 useStrictDetection:(BOOL)a5
{
  id v8;
  id v9;
  const OpaqueJSValue *v10;
  SafariShared::JSUtilities *v11;
  JSObjectRef v12;
  const char *v13;
  const OpaqueJSContext *v14;
  const OpaqueJSContext *v15;
  const OpaqueJSValue *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  char v22[8];
  JSValueRef Boolean;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v9, 0);
  v10 = (const OpaqueJSValue *)objc_msgSend(v9, "jsWrapperInMetadataControllerScriptWorldForNode:", v8);
  if (v10
    && (v11 = (SafariShared::JSUtilities *)objc_msgSend(v9, "jsContextForMetadataControllerScriptWorld"),
        v12 = JSValueToObject(v11, v10, 0),
        (v14 = SafariShared::JSUtilities::globalJSObjectByName(v11, (const OpaqueJSContext *)"FormMetadataJS", v13)) != 0)
    && (*(_QWORD *)v22 = v12,
        Boolean = JSValueMakeBoolean(v11, a5),
        (v15 = SafariShared::JSUtilities::callJSMethodWithArguments(v11, v14, (OpaqueJSValue *)"searchTextFieldFormSubmissionURLString", v22, (const OpaqueJSValue *const *)2)) != 0))
  {
    SafariShared::JSUtilities::translateJSValueToNS(v11, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17 == v18;

    if (v19)
      v20 = 0;
    else
      v20 = v17;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)visibleNonEmptyTextFieldsInForm:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  const OpaqueJSValue *v8;
  const OpaqueJSContext *v9;
  const char *v10;
  const OpaqueJSContext *v11;
  const OpaqueJSValue *v12;
  const OpaqueJSContext *v13;
  const OpaqueJSValue **v14;
  const OpaqueJSValue *PropertyAtIndex;
  const OpaqueJSValue **v16;
  const OpaqueJSContext *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const OpaqueJSValue *v21;
  JSObjectRef v22;
  void *v23;
  JSValueRef v25;
  char v26[8];

  v6 = a3;
  v7 = a4;
  -[WBSFormMetadataController metadataForFrame:requestType:](self, "metadataForFrame:requestType:", v7, 0);
  v8 = (const OpaqueJSValue *)objc_msgSend(v7, "jsWrapperInMetadataControllerScriptWorldForNode:", v6);
  if (v8)
  {
    v9 = (const OpaqueJSContext *)objc_msgSend(v7, "jsContextForMetadataControllerScriptWorld");
    *(_QWORD *)v26 = JSValueToObject(v9, v8, 0);
    v11 = SafariShared::JSUtilities::globalJSObjectByName(v9, (const OpaqueJSContext *)"FormMetadataJS", v10);
    if (!v11)
      goto LABEL_18;
    v12 = SafariShared::JSUtilities::callJSMethodWithArguments(v9, v11, (OpaqueJSValue *)"visibleNonEmptyFormTextControlsInForm", v26, (const OpaqueJSValue *const *)1);
    if (!v12)
      goto LABEL_18;
    v13 = JSValueToObject(v9, v12, 0);
    v25 = 0;
    v8 = 0;
    if (SafariShared::JSUtilities::arrayLength(v9, v13, &v25, v14) != 2 || v25)
      goto LABEL_19;
    PropertyAtIndex = JSObjectGetPropertyAtIndex(v9, v13, 0, 0);
    if (!PropertyAtIndex || (v17 = JSValueToObject(v9, PropertyAtIndex, 0)) == 0)
    {
LABEL_18:
      v8 = 0;
      goto LABEL_19;
    }
    v18 = SafariShared::JSUtilities::arrayLength(v9, v17, &v25, v16);
    v8 = 0;
    if (!v25)
    {
      v19 = v18;
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
        v8 = (const OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        do
        {
          v21 = JSObjectGetPropertyAtIndex(v9, v17, v20, 0);
          if (v21)
          {
            v22 = JSValueToObject(v9, v21, 0);
            if (v22)
            {
              -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v22, v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
                -[OpaqueJSValue addObject:](v8, "addObject:", v23);

            }
          }
          ++v20;
        }
        while (v19 != v20);
      }
    }
  }
LABEL_19:

  return v8;
}

- (BOOL)shouldIncludeNonEmptyFields
{
  return 0;
}

- (BOOL)manualAutoFillButtonWillFitInFieldWithMetadata:(id)a3
{
  id v3;
  double v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "isVerticalWritingMode"))
    objc_msgSend(v3, "rectHeight");
  else
    objc_msgSend(v3, "rectWidth");
  v5 = v4 >= 100.0;

  return v5;
}

- (id)substitutePasswordElementsWithAutomaticPasswordElementsInFrame:(id)a3 formID:(double)a4 focusedPasswordControlUniqueID:(id)a5 passwordControlUniqueIDs:(id)a6 automaticPassword:(id)a7 blurAfterSubstitution:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  OpaqueJSContext *v14;
  SafariShared::JSUtilities *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  objc_object *v22;
  const OpaqueJSContext *v23;
  OpaqueJSContext *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31[8];
  _BYTE v32[128];
  uint64_t v33;

  v8 = a8;
  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (OpaqueJSContext *)a5;
  v25 = v14;
  v26 = a7;
  v15 = (SafariShared::JSUtilities *)objc_msgSend(v13, "jsContextForMetadataControllerScriptWorld");
  if (v15)
  {
    -[WBSFormMetadataController fillForm:inFrame:withPassword:focusedFieldControlID:](self, "fillForm:inFrame:withPassword:focusedFieldControlID:", v13, v26, v14, a4);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v16);
          -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", controlObject(v13, *(void **)(*((_QWORD *)&v27 + 1) + 8 * i)), v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabled"))
          {
            if (v8)
              objc_msgSend(v20, "setHTMLInputElementAutoFilledAndObscured:", 1);
            else
              objc_msgSend(v20, "setHTMLInputElementAutoFilledAndViewable:", 1);
          }
          else
          {
            objc_msgSend(v20, "setHTMLInputElementAutoFilledWithAutomaticStrongPassword:", 1);
          }

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v17);
    }

    if (v8)
    {
      v23 = SafariShared::JSUtilities::globalJSObjectByName(v15, (const OpaqueJSContext *)"AutomaticPasswordsJS", v21);
      if (v23)
      {
        *(_QWORD *)v31 = SafariShared::JSUtilities::translateNSToJSValue(v15, v25, v22);
        SafariShared::JSUtilities::callJSMethodWithArguments(v15, v23, (OpaqueJSValue *)"blurControlWithID", v31, (const OpaqueJSValue *const *)1);
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5 blurAfterRemoval:(BOOL)a6
{
  id v9;
  id v10;
  SafariShared::JSUtilities *v11;
  const char *v12;
  SafariShared::JSUtilities *v13;
  const OpaqueJSContext *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_object *v20;
  objc_object *v21;
  OpaqueJSContext *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28[8];
  uint64_t v29;
  JSValueRef v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v23 = (OpaqueJSContext *)a4;
  v10 = a5;
  v11 = (SafariShared::JSUtilities *)objc_msgSend(v9, "jsContextForMetadataControllerScriptWorld");
  v13 = v11;
  if (v11)
  {
    v14 = SafariShared::JSUtilities::globalJSObjectByName(v11, (const OpaqueJSContext *)"AutomaticPasswordsJS", v12);
    if (v14)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", controlObject(v9, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18)), v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setHTMLInputElementAutoFilledAndViewable:", 0);
            objc_msgSend(v19, "setHTMLInputElementAutoFilledWithAutomaticStrongPassword:", 0);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        }
        while (v16);
      }

      *(_QWORD *)v28 = SafariShared::JSUtilities::translateNSToJSValue(v13, (const OpaqueJSContext *)v15, v20);
      v29 = SafariShared::JSUtilities::translateNSToJSValue(v13, v23, v21);
      v30 = JSValueMakeBoolean(v13, a6);
      SafariShared::JSUtilities::callJSMethodWithArguments(v13, v14, (OpaqueJSValue *)"removeAutomaticPasswordElements", v28, (const OpaqueJSValue *const *)3);
    }
  }

}

- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const OpaqueJSContext *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "jsContextForMetadataControllerScriptWorld");
  if (v8)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = controlObject(v6, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12));
          -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v13, v8, (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setHTMLInputElementAutoFilledWithAutomaticStrongPassword:", 0);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)automaticPasswordSheetDimissedInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4
{
  const OpaqueJSContext *v5;
  SafariShared::JSUtilities *v6;
  const char *v7;
  SafariShared::JSUtilities *v8;
  objc_object *v9;
  const OpaqueJSContext *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (const OpaqueJSContext *)a4;
  v6 = (SafariShared::JSUtilities *)objc_msgSend(a3, "jsContextForMetadataControllerScriptWorld");
  v8 = v6;
  if (v6)
  {
    v10 = SafariShared::JSUtilities::globalJSObjectByName(v6, (const OpaqueJSContext *)"AutomaticPasswordsJS", v7);
    if (v10)
    {
      v11[0] = SafariShared::JSUtilities::translateNSToJSValue(v8, v5, v9);
      SafariShared::JSUtilities::callJSMethodWithArguments(v8, v10, (OpaqueJSValue *)"blurControlWithID", (const char *)v11, (const OpaqueJSValue *const *)1);
    }
  }

}

- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5
{
  const OpaqueJSContext *v7;
  SafariShared::JSUtilities *v8;
  const char *v9;
  SafariShared::JSUtilities *v10;
  objc_object *v11;
  const OpaqueJSContext *v12;
  char v13[8];
  JSValueRef Boolean;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (const OpaqueJSContext *)a5;
  v8 = (SafariShared::JSUtilities *)objc_msgSend(a4, "jsContextForMetadataControllerScriptWorld");
  v10 = v8;
  if (v8)
  {
    v12 = SafariShared::JSUtilities::globalJSObjectByName(v8, (const OpaqueJSContext *)"AutomaticPasswordsJS", v9);
    if (v12)
    {
      *(_QWORD *)v13 = SafariShared::JSUtilities::translateNSToJSValue(v10, v7, v11);
      Boolean = JSValueMakeBoolean(v10, a3);
      SafariShared::JSUtilities::callJSMethodWithArguments(v10, v12, (OpaqueJSValue *)"setStrongPasswordElementViewableIfAppropriate", v13, (const OpaqueJSValue *const *)2);
    }
  }

}

- (id)metadataForActiveFormInPageWithMainFrame:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id v14;
  id v15;

  v14 = 0;
  v15 = 0;
  -[WBSFormMetadataController getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:](self, "getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:", a3, 4, &v15, &v14);
  v3 = v15;
  v4 = v14;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__13;
  v12 = __Block_byref_object_dispose__13;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFormMetadataController_metadataForActiveFormInPageWithMainFrame___block_invoke;
  v7[3] = &unk_1E4B3A458;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __70__WBSFormMetadataController_metadataForActiveFormInPageWithMainFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "containsActiveElement") & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  const OpaqueJSContext *v11;
  void *v12;
  id v13;

  v6 = a3;
  v13 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "jsContextForMetadataControllerScriptWorld");
  if (v9
    && -[WBSFormMetadataController manualAutoFillButtonWillFitInFieldWithMetadata:](self, "manualAutoFillButtonWillFitInFieldWithMetadata:", v13))
  {
    objc_msgSend(v13, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = controlObject(v8, v10);

    -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSpinnerVisibilityOnHTMLInputElement:", v6);

  }
}

+ (id)formMetadataClassificationJS
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, JSValueRef (__cdecl *)(JSContextRef, JSObjectRef, JSObjectRef, size_t, const JSValueRef[], JSValueRef *));
  void *v40;
  id v41;
  id v42;

  v2 = objc_alloc_init(MEMORY[0x1E0CBE0F0]);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithBytes:length:encoding:", formMetadataClassificationSource, formMetadataClassificationSourceLength, 1);
  objc_msgSend(v2, "globalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 0, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forProperty:", v6, CFSTR("WBSFormMetadataRequestNormal"));

  objc_msgSend(v2, "globalObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 1, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forProperty:", v8, CFSTR("WBSFormMetadataRequestPreFill"));

  objc_msgSend(v2, "globalObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 2, v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forProperty:", v10, CFSTR("WBSFormMetadataRequestTesting"));

  objc_msgSend(v2, "globalObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 3, v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forProperty:", v12, CFSTR("WBSFormMetadataRequestTextChange"));

  objc_msgSend(v2, "globalObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 4, v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forProperty:", v14, CFSTR("WBSFormMetadataRequestCollectMetadataFromDebugMenu"));

  objc_msgSend(v2, "globalObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 0, v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forProperty:", v16, CFSTR("WBSAutoFillFormTypeUndetermined"));

  objc_msgSend(v2, "globalObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 1, v2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forProperty:", v18, CFSTR("WBSAutoFillFormTypeAutoFillableStandard"));

  objc_msgSend(v2, "globalObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 2, v2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forProperty:", v20, CFSTR("WBSAutoFillFormTypeNonAutoFillable"));

  objc_msgSend(v2, "globalObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 3, v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:forProperty:", v22, CFSTR("WBSAutoFillFormTypeAutoFillableLogin"));

  objc_msgSend(v2, "globalObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 4, v2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forProperty:", v24, CFSTR("WBSAutoFillFormTypeNewAccount"));

  objc_msgSend(v2, "globalObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUInt32:inContext:", 5, v2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValue:forProperty:", v26, CFSTR("WBSAutoFillFormTypeChangePassword"));

  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithNewObjectInContext:", v2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __57__WBSFormMetadataController_formMetadataClassificationJS__block_invoke;
  v40 = &unk_1E4B3A480;
  v28 = v2;
  v41 = v28;
  v29 = v27;
  v42 = v29;
  v30 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](&v37);
  ((void (**)(_QWORD, const __CFString *, JSValueRef (*)(SafariShared *, const OpaqueJSContext *, NSString *, OpaqueJSValue *, JSValueRef *, JSObjectRef *, const OpaqueJSValue **)))v30)[2](v30, CFSTR("specifierForAutocompleteTokensAndAddressBookLabel"), SafariShared::jsSpecifierForAutocompleteTokensAndAddressBookLabel);
  ((void (**)(_QWORD, const __CFString *, JSValueRef (*)(SafariShared *, const OpaqueJSContext *, NSString *, OpaqueJSValue *, JSValueRef *, JSObjectRef *, const OpaqueJSValue **)))v30)[2](v30, CFSTR("dateFormatFromTemplate"), SafariShared::jsDateFormatFromTemplate);
  ((void (**)(_QWORD, const __CFString *, JSValueRef (*)(SafariShared *, const OpaqueJSContext *, NSString *, OpaqueJSValue *, JSValueRef *, JSObjectRef *, const OpaqueJSValue **)))v30)[2](v30, CFSTR("stringFromDateFormat"), SafariShared::jsStringFromDateFormat);
  objc_msgSend(v28, "globalObject", v37, v38, v39, v40);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setValue:forProperty:", v29, CFSTR("FormMetadataJSController"));

  objc_msgSend(v28, "setExceptionHandler:", &__block_literal_global_120);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("FormMetadataClassification.js"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v28, "evaluateScript:withSourceURL:", v4, v32);

  objc_msgSend(v28, "globalObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("FormMetadataClassificationJS"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __57__WBSFormMetadataController_formMetadataClassificationJS__block_invoke(uint64_t a1, void *a2, JSValueRef (__cdecl *a3)(JSContextRef, JSObjectRef, JSObjectRef, size_t, const JSValueRef[], JSValueRef *))
{
  __CFString *v5;
  const OpaqueJSContext *v6;
  JSObjectRef FunctionWithCallback;
  void *v8;
  JSStringRef name;

  v5 = a2;
  v6 = (const OpaqueJSContext *)objc_msgSend(*(id *)(a1 + 32), "JSGlobalContextRef");
  SafariShared::JSUtilities::jsString(v5, &name);
  FunctionWithCallback = JSObjectMakeFunctionWithCallback(v6, name, a3);
  if (name)
    JSStringRelease(name);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", FunctionWithCallback, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forProperty:", v8, v5);

}

void __57__WBSFormMetadataController_formMetadataClassificationJS__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  v5 = (void *)WBS_LOG_CHANNEL_PREFIXAutoFill();
  SafariShared::JSUtilities::logExceptionInChannel(v5, (const OpaqueJSContext *)objc_msgSend(v6, "JSGlobalContextRef"), (const OpaqueJSValue *)objc_msgSend(v4, "JSValueRef"));

}

+ (id)classifyFormMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  WBSFormMetadata *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "formMetadataClassificationJS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v4, "dictionaryRepresentationRedactingSensitiveValues:withKnownSensitiveValues:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithObject:inContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E4B87AC0, CFSTR("RequestType"));
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("classify"), v10);

  v12 = -[WBSFormMetadata initWithJSValue:]([WBSFormMetadata alloc], "initWithJSValue:", v9);
  return v12;
}

- (void)textFieldFocused:(os_log_t)log inFrame:textFieldMetadata:formMetadata:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Text field focused in an untracked frame.", v1, 2u);
}

@end
