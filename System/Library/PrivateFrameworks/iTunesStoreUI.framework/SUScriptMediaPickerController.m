@implementation SUScriptMediaPickerController

- (SUScriptMediaPickerController)initWithMediaTypes:(id)a3
{
  SUScriptMediaPickerController *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  v5 = -[SUScriptObject init](self, "init");
  if (v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__26;
    v14 = __Block_byref_object_dispose__26;
    v15 = 0;
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v6 = objc_msgSend(a3, "copyArrayValueWithValidator:context:", __SUMediaTypeValidator, 0),
            (v11[5] = v6) == 0))
      {
        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));

        v5 = 0;
LABEL_11:

        _Block_object_dispose(&v10, 8);
        return v5;
      }
    }
    else
    {
      v7 = +[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", -1);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, 0);
      v11[5] = v8;
    }
    WebThreadRunOnMainThread();
    goto LABEL_11;
  }
  return v5;
}

void __52__SUScriptMediaPickerController_initWithMediaTypes___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;

  v2 = +[SUScriptMediaItem nativeMediaTypesForScriptMediaTypes:](SUScriptMediaItem, "nativeMediaTypesForScriptMediaTypes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7F8]), "initWithMediaTypes:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setNativeViewController:", v3);

}

- (id)newNativeViewController
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7F8]), "initWithMediaTypes:", -1);
}

- (void)setNativeViewController:(id)a3
{
  objc_super v3;

  if (a3)
  {
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptMediaPickerNativeObject, "objectWithNativeObject:"));
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SUScriptMediaPickerController;
    -[SUScriptViewController setNativeViewController:](&v3, sel_setNativeViewController_);
  }
}

- (BOOL)allowsPickingMultipleItems
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __59__SUScriptMediaPickerController_allowsPickingMultipleItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "allowsPickingMultipleItems");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesMediaPickerController");
}

- (NSArray)mediaTypes
{
  void *v2;
  NSArray *v3;
  NSArray *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __43__SUScriptMediaPickerController_mediaTypes__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __43__SUScriptMediaPickerController_mediaTypes__block_invoke(uint64_t a1)
{
  id result;

  result = +[SUScriptMediaItem copyScriptMediaTypesForNativeMediaTypes:](SUScriptMediaItem, "copyScriptMediaTypesForNativeMediaTypes:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "mediaTypes"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)prompt
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __39__SUScriptMediaPickerController_prompt__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptMediaPickerController_prompt__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "prompt");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __63__SUScriptMediaPickerController_setAllowsPickingMultipleItems___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setAllowsPickingMultipleItems:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setPrompt:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __43__SUScriptMediaPickerController_setPrompt___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setPrompt:", *(_QWORD *)(a1 + 40));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_38, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPickerController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPickerController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_38, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_38 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("allowsPickingMultipleItems"), CFSTR("mediaTypes"), CFSTR("mediaTypes"), CFSTR("prompt"), CFSTR("prompt"), 0);
}

@end
