@implementation MusicModelMenu

+ (id)__jsMenu_KEY
{
  return CFSTR("MusicModelMenuJSMenu");
}

+ (MusicModelMenu)menuWithJSMenu:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __33__MusicModelMenu_menuWithJSMenu___block_invoke;
  v9[3] = &unk_133A598;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "initWithIdentifiers:block:", 0, v9);

  return (MusicModelMenu *)v7;
}

id __33__MusicModelMenu_menuWithJSMenu___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setJsMenu:", *(_QWORD *)(a1 + 32));
}

@end
