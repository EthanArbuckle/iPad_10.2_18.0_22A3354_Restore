@implementation OpenLookAroundActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(OpenLookAroundAction);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "muninViewState"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "muninViewState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMuninViewState:](MKLookAroundEntryPoint, "entryPointWithMuninViewState:", v11));
      objc_msgSend(v10, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v12, 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalMapItem"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTraits"));

        objc_msgSend(v15, "setSource:", 1);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100399208;
        v16[3] = &unk_1011B39F0;
        v17 = v6;
        v18 = v8;
        objc_msgSend(v18, "resolveMapItemWithTraits:completion:", v15, v16);

      }
    }

  }
}

@end
