@implementation _UIReturnToDocumentAction

+ (BOOL)_hasReturnToSenderFeature
{
  if (qword_1ECD808A0 != -1)
    dispatch_once(&qword_1ECD808A0, &__block_literal_global_517);
  return _MergedGlobals_1232;
}

+ (id)actionWithFileURL:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[1] = 3221225472;
  v8[2] = __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke;
  v8[3] = &unk_1E16E36E8;
  v9 = a3;
  v10 = a1;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____UIReturnToDocumentAction;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = v9;
  objc_msgSendSuper2(&v7, sel_elementWithProvider_, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
