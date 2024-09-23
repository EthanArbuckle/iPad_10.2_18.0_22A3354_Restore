@implementation BSUIElementAudiobookControl

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_32BFE8 != -1)
    dispatch_once(&qword_32BFE8, &stru_2E48A0);
  return (id)qword_32BFE0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(BSUIAudiobookControlBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  var0 = a4.var0;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForAttribute:node:", 113, var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForAttribute:node:", 150, var0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dynamicRegistry"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "progressProviderForKind:", CFSTR("audiobookProgress")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicProgressForKind:instance:parameters:", CFSTR("chapterProgress"), v23, v12));
  v17 = BUProtocolCast(&OBJC_PROTOCOL___BSUIDynamicAudiobookProgress, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dynamicRegistry"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stateProviderForKind:", CFSTR("libraryItem")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dynamicStateForKind:instance:parameters:", CFSTR("libraryItem"), v23, v12));
  objc_msgSend(v11, "setDynamicAudiobookProgress:", v18);
  objc_msgSend(v11, "setDynamicState:", v22);

}

@end
