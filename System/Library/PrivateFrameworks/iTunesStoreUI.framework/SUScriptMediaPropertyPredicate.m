@implementation SUScriptMediaPropertyPredicate

- (SUScriptMediaPropertyPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(id)a5
{
  SUScriptMediaPropertyPredicate *v7;
  char isKindOfClass;
  const __CFString *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a5 = 0;
  v7 = -[SUScriptObject init](self, "init");
  if (v7)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(a5, "isEqualToString:", CFSTR("equals")) & 1) != 0)
          goto LABEL_10;
        if (objc_msgSend(a5, "isEqualToString:", CFSTR("contains")))
        {
          if ((isKindOfClass & 1) != 0)
            goto LABEL_11;
          goto LABEL_18;
        }
        v9 = CFSTR("Unknown comparison type");
      }
      else
      {
        v9 = CFSTR("Invalid argument");
      }
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", v9);
      goto LABEL_18;
    }
LABEL_10:
    if ((isKindOfClass & 1) != 0)
    {
LABEL_11:
      WebThreadRunOnMainThread();
      return v7;
    }
LABEL_18:

    return 0;
  }
  return v7;
}

uint64_t __72__SUScriptMediaPropertyPredicate_initWithProperty_value_comparisonType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BDDBD58]))
    v2 = objc_msgSend(*(id *)(a1 + 48), "_playlistAttributesForScriptArray:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:comparisonType:", v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (result)
    return objc_msgSend(*(id *)(a1 + 48), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", result));
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPropertyPredicate;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (MPMediaPropertyPredicate)nativePredicate
{
  return (MPMediaPropertyPredicate *)-[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
}

- (id)_className
{
  return CFSTR("iTunesMediaPropertyPredicate");
}

- (NSString)comparisonType
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
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __48__SUScriptMediaPropertyPredicate_comparisonType__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __48__SUScriptMediaPropertyPredicate_comparisonType__block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "comparisonType");
  if (result == 1)
  {
    v3 = CFSTR("contains");
  }
  else
  {
    if (result)
      return result;
    v3 = CFSTR("equals");
  }
  result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)property
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
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __42__SUScriptMediaPropertyPredicate_property__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __42__SUScriptMediaPropertyPredicate_property__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "property");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)value
{
  void *v2;
  id v3;
  void *v4;
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
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __39__SUScriptMediaPropertyPredicate_value__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptMediaPropertyPredicate_value__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "value");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_playlistAttributesForScriptArray:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[SUScriptMediaPlaylist nativePlaylistAttributesForScriptPlaylistAttributes:](SUScriptMediaPlaylist, "nativePlaylistAttributesForScriptPlaylistAttributes:", v4));

  return v6;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_37, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPropertyPredicate;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPropertyPredicate;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_37, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_37 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("comparisonType"), CFSTR("property"), CFSTR("property"), CFSTR("value"), CFSTR("value"), 0);
}

@end
