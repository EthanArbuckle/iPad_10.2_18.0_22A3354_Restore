@implementation UIWebClipIcon

- (int64_t)compare:(id)a3 preferringDeviceIconSizes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a4;
  v6 = a3;
  if (-[UIWebClipIcon isSiteWide](self, "isSiteWide") && !objc_msgSend(v6, "isSiteWide"))
    goto LABEL_14;
  if (!-[UIWebClipIcon isSiteWide](self, "isSiteWide") && (objc_msgSend(v6, "isSiteWide") & 1) != 0)
    goto LABEL_15;
  if (!v4)
  {
    -[UIWebClipIcon bestSize](self, "bestSize");
    v16 = v15;
    objc_msgSend(v6, "bestSize");
    if (v16 > v17)
      goto LABEL_15;
    -[UIWebClipIcon bestSize](self, "bestSize");
    v19 = v18;
    objc_msgSend(v6, "bestSize");
    if (v19 >= v20)
    {
LABEL_10:
      if (!-[UIWebClipIcon isPrecomposed](self, "isPrecomposed") || objc_msgSend(v6, "isPrecomposed"))
      {
        if (-[UIWebClipIcon isPrecomposed](self, "isPrecomposed") || (objc_msgSend(v6, "isPrecomposed") & 1) == 0)
        {
          v14 = 0;
          goto LABEL_16;
        }
        goto LABEL_14;
      }
LABEL_15:
      v14 = 1;
      goto LABEL_16;
    }
LABEL_14:
    v14 = -1;
    goto LABEL_16;
  }
  v7 = (void *)MEMORY[0x1E0CA5910];
  -[UIWebClipIcon bestSize](self, "bestSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "bestSize");
  v14 = objc_msgSend(v7, "_compareApplicationIconCanvasSize:withSize:", v9, v11, v12, v13);
  if (!v14)
    goto LABEL_10;
LABEL_16:

  return v14;
}

- (BOOL)isPrecomposed
{
  return self->_precomposed;
}

- (void)setPrecomposed:(BOOL)a3
{
  self->_precomposed = a3;
}

- (BOOL)isSiteWide
{
  return self->_siteWide;
}

- (void)setSiteWide:(BOOL)a3
{
  self->_siteWide = a3;
}

- (CGSize)bestSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bestSize.width;
  height = self->_bestSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBestSize:(CGSize)a3
{
  self->_bestSize = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
