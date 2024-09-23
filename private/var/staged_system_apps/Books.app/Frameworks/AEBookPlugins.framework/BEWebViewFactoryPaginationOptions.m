@implementation BEWebViewFactoryPaginationOptions

+ (id)paginationOptionsForBookInfoSnapshot:(id)a3 withConfiguration:(id)a4 contentLayoutSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _BOOL8 v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isFixedLayout"))
  {
    v10 = objc_alloc((Class)BEWebViewFactoryPaginationOptions);
    objc_msgSend(v8, "fixedLayoutSize");
    v11 = objc_msgSend(v10, "initWithFixedSize:");
  }
  else
  {
    if ((objc_msgSend(v9, "isScroll") & 1) != 0)
    {
      v12 = 0;
    }
    else if (objc_msgSend(v8, "bkPageProgressionDirection") == 1)
    {
      v12 = 3;
    }
    else
    {
      v12 = 2;
    }
    v13 = objc_alloc((Class)BEWebViewFactoryPaginationOptions);
    v14 = objc_msgSend(v9, "usePaginationLineGrid");
    v15 = objc_msgSend(v8, "obeyPageBreaks");
    v16 = objc_msgSend(v9, "layout") == (char *)&dword_0 + 3;
    objc_msgSend(v9, "gutterWidth");
    v18 = v17;
    objc_msgSend(v9, "fontSize");
    v11 = objc_msgSend(v13, "initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:", v12, v14, v15, v16, objc_msgSend(v8, "shouldAllowRemoteInspection"), width, height, v18, width, CGSizeZero.width, CGSizeZero.height, width, v19);
  }
  v20 = v11;

  return v20;
}

@end
