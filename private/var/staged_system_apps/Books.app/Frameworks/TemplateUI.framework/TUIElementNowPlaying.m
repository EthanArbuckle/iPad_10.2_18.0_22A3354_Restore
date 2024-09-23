@implementation TUIElementNowPlaying

+ (id)supportedAttributes
{
  if (qword_2CB260 != -1)
    dispatch_once(&qword_2CB260, &stru_23DE50);
  return (id)qword_2CB258;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUINowPlayingBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 151, var0));
  v13 = v10;
  if (v10)
    v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("playing")) == 0;
  else
    v11 = 0;
  objc_msgSend(v9, "setPlaying:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 51, var0));

  objc_msgSend(v9, "setColor:", v12);
}

@end
