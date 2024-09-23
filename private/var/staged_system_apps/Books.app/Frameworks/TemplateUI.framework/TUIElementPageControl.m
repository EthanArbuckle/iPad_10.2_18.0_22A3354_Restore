@implementation TUIElementPageControl

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIStatefulElementBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementPageControlBuilder, a2);
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  _TUIElementPageControlBuilder *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = objc_alloc_init(_TUIElementPageControlBuilder);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 116, a3.var0));

  v10 = v9;
  v11 = v10;
  if (qword_2CBA20 != -1)
  {
    dispatch_once(&qword_2CBA20, &stru_242E38);
    if (v11)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBA18, "objectForKeyedSubscript:", v11));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

LABEL_6:
  -[_TUIElementPageControlBuilder setKind:](v8, "setKind:", v13);

  return v8;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  void *v9;
  id v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v11 = a3;
  objc_msgSend(v11, "setEnabled:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 74, 1, var0));
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 156, var0, 1.0);
  objc_msgSend(v11, "setPressedScale:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointerForNode:", var0));
  objc_msgSend(v11, "setPointer:", v9);

  v10 = objc_msgSend(v8, "BOOLForAttribute:node:", 93, var0);
  objc_msgSend(v11, "setGrouped:", v10);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeStateMapWithContext:", v9));
  objc_msgSend(v7, "setStateMap:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v11);

  v12 = objc_msgSend(v8, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pointer"));
  objc_initWeak(&location, v7);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_157F3C;
  v15[3] = &unk_242E18;
  objc_copyWeak(v17, &location);
  v14 = v13;
  v16 = v14;
  v17[1] = v12;
  objc_msgSend(v7, "setRenderModelBlock:", v15);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

@end
