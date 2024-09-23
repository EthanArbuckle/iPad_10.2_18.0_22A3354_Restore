@implementation THTestDriver

+ (id)validateController:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(THBookViewController, a2);
  return (id)BUDynamicCast(v4, a3);
}

+ (BOOL)turnPageWithBookController:(id)a3 direction:(int)a4
{
  id v5;
  void *v6;
  id (*v7)(uint64_t);
  void ***p_block;
  void **v10;
  void **block;

  v5 = objc_msgSend(a1, "validateController:", a3);
  if (v5)
  {
    v6 = v5;
    v5 = objc_msgSend(v5, "documentViewController");
    if (v5)
    {
      v5 = objc_msgSend(objc_msgSend(v6, "documentViewController"), "interactiveCanvasController");
      if (v5)
      {
        if (a4 < 0)
        {
          block = _NSConcreteStackBlock;
          v7 = sub_549BC;
          p_block = &block;
        }
        else
        {
          v10 = _NSConcreteStackBlock;
          v7 = sub_549D8;
          p_block = &v10;
        }
        p_block[1] = (void **)3221225472;
        p_block[2] = (void **)v7;
        p_block[3] = (void **)&unk_426DD0;
        p_block[4] = (void **)v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, p_block);
        LOBYTE(v5) = 1;
      }
    }
  }
  return (char)v5;
}

+ (BOOL)closeBookWithBookController:(id)a3
{
  id v3;
  id v4;
  _QWORD block[5];

  v3 = objc_msgSend(a1, "validateController:", a3);
  v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_54A68;
    block[3] = &unk_426DD0;
    block[4] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v4 != 0;
}

+ (BOOL)goToFirstChapterWithController:(id)a3
{
  id v3;
  id v4;
  _QWORD block[5];

  v3 = objc_msgSend(a1, "validateController:", a3);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "chapterBrowserController"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_54AE8;
      block[3] = &unk_426DD0;
      block[4] = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  return 0;
}

@end
