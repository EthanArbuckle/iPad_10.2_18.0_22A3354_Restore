@implementation FRFeedImageGenerationOperation

+ (id)sharedOperationQueue
{
  if (qword_10010A540 != -1)
    dispatch_once(&qword_10010A540, &stru_1000DBA68);
  return (id)qword_10010A538;
}

- (FRFeedImageGenerationOperation)initWithOptions:(id)a3
{
  id v4;
  FRFeedImageGenerationOperation *v5;
  FRFeedImageGenerationOptions *v6;
  FRFeedImageGenerationOptions *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRFeedImageGenerationOperation;
  v5 = -[FRFeedImageGenerationOperation init](&v9, "init");
  if (v5)
  {
    v6 = (FRFeedImageGenerationOptions *)objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = v6;

  }
  return v5;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  const char *v28;
  id v29;
  __CFError *v30;
  void *v31;
  unsigned int v32;
  const __CFArray *v33;
  const __CFArray *v34;
  const void *ValueAtIndex;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CGImage *v46;
  CGImage *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  __CFError *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  CGImage *v63;
  id v64;
  uint64_t v65;
  void *v66;
  __CFError *value;
  _QWORD v68[4];
  NSObject *v69;
  _QWORD v70[4];
  NSObject *v71;

  if ((-[FRFeedImageGenerationOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = dispatch_group_create();
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backingTag"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "theme"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
    v11 = objc_msgSend(v10, "punchThroughEffect");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation _bannerImageForTheme:punchOutEffect:](self, "_bannerImageForTheme:punchOutEffect:", v9, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetHandle"));
    if (v13
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "theme")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logoImageAssetHandle")),
          v14,
          v13))
    {
      dispatch_group_enter(v3);
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10003E6A8;
      v70[3] = &unk_1000D9758;
      v71 = v3;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "downloadIfNeededWithCompletion:", v70));
      -[FRFeedImageGenerationOperation setLogoDownloadOperation:](self, "setLogoDownloadOperation:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "coverImageAssetHandle"));
    if (v16)
    {
      dispatch_group_enter(v3);
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10003E6B0;
      v68[3] = &unk_1000D9758;
      v69 = v3;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "downloadIfNeededWithCompletion:", v68));
      -[FRFeedImageGenerationOperation setCoverDownloadOperation:](self, "setCoverDownloadOperation:", v17);

    }
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    if ((-[FRFeedImageGenerationOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_49;
    v59 = v9;
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueKey"));
    v19 = v18;
    if (!v18)
      v18 = &stru_1000DF290;
    v57 = (__CFError *)-[__CFString hash](v18, "hash");

    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueKey"));
    v21 = v20;
    if (!v20)
      v20 = &stru_1000DF290;
    v22 = -[__CFString hash](v20, "hash");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cachedImagePath"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = objc_msgSend(v25, "fileExistsAtPath:", v24);

    v60 = v24;
    if (v26)
    {
      v27 = objc_retainAutorelease(v24);
      v28 = (const char *)objc_msgSend(v27, "cStringUsingEncoding:", 4);
      value = 0;
      getxattr(v28, "com.apple.news.coverAssetVersion", &value, 8uLL, 0, 0);
      v66 = 0;
      getxattr(v28, "com.apple.news.logoAssetVersion", &v66, 8uLL, 0, 0);
      v29 = v66;
      v30 = value;
      if ((-[FRFeedImageGenerationOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        if (v30 == v57 && v29 == v22)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v32 = objc_msgSend(v31, "fileExistsAtPath:", v27);

          if (v32)
          {
            value = 0;
            v33 = (const __CFArray *)CPBitmapCreateImagesFromPath(v27, 0, 2, &value);
            v34 = v33;
            if (v33 && CFArrayGetCount(v33) >= 1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v34, 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
              objc_msgSend(v36, "scale");
              v37 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", ValueAtIndex, 0));

            }
            else
            {
              v53 = (uint64_t)v27;
              v54 = (void *)FCDefaultLog;
              if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
                sub_10007D564(v53, &value, v54);
              v37 = 0;
            }
            if (value)
              CFRelease(value);
            if (v34)
              CFRelease(v34);
          }
          else
          {
            v37 = 0;
          }
          -[FRFeedImageGenerationOperation setImage:](self, "setImage:", v37);
LABEL_47:

          goto LABEL_48;
        }
LABEL_21:
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filePath"));
        v39 = objc_msgSend(v38, "length");

        if (v39)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filePath"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v40));

        }
        else
        {
          v41 = 0;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asChannel"));

        if (v42)
        {
          if (!v41)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation _tintedImageWithCoverImage:](self, "_tintedImageWithCoverImage:", 0));
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation _finalizeImageWithCoverImage:](self, "_finalizeImageWithCoverImage:", v45));

LABEL_30:
            v37 = objc_retainAutorelease(v44);
            v46 = (CGImage *)objc_msgSend(v37, "CGImage");
            if (v37)
            {
              v47 = v46;
              if (v46)
              {
                CGImageRetain(v46);
                v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueKey"));
                v49 = v48;
                v58 = v41;
                if (!v48)
                  v48 = &stru_1000DF290;
                v55 = -[__CFString hash](v48, "hash");

                v50 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueKey"));
                v51 = v50;
                if (!v50)
                  v50 = &stru_1000DF290;
                v52 = -[__CFString hash](v50, "hash", v55);

                v61[0] = _NSConcreteStackBlock;
                v61[1] = 3221225472;
                v61[2] = sub_10003E6B8;
                v61[3] = &unk_1000DA298;
                v63 = v47;
                v62 = v60;
                v64 = v52;
                v41 = v58;
                v65 = v56;
                +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v61);

              }
            }
            -[FRFeedImageGenerationOperation setImage:](self, "setImage:", v37);

            goto LABEL_47;
          }
          v43 = objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation _finalizeImageWithCoverImage:](self, "_finalizeImageWithCoverImage:", v41));
        }
        else
        {
          v43 = objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation _topicCardImage](self, "_topicCardImage"));
        }
        v44 = (void *)v43;
        goto LABEL_30;
      }
    }
    else if ((-[FRFeedImageGenerationOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      goto LABEL_21;
    }
LABEL_48:

    v9 = v59;
LABEL_49:

  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRFeedImageGenerationOperation;
  -[FRFeedImageGenerationOperation cancel](&v5, "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation coverDownloadOperation](self, "coverDownloadOperation"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation logoDownloadOperation](self, "logoDownloadOperation"));
  objc_msgSend(v4, "cancel");

}

- (id)_bannerImageForTheme:(id)a3 punchOutEffect:(BOOL)a4
{
  void *v4;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bannerImageForMask"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "defaultBannerImage"));
  return v4;
}

- (CGRect)rectForOnePixelStroke:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  v10 = x + v9 * 0.5;
  v11 = y + v9 * 0.5;
  v12 = width - v9;
  v13 = height - v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)_topicCardImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v12[11];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v3, "scale");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003EA20;
  v12[3] = &unk_1000DBA90;
  *(double *)&v12[5] = v8;
  *(double *)&v12[6] = v10;
  v12[4] = self;
  v12[7] = 0;
  v12[8] = 0;
  *(double *)&v12[9] = v8;
  *(double *)&v12[10] = v10;
  return (id)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 1, v12, v8, v10, v5));
}

- (id)_tintedImageWithCoverImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "feed"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingTag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asChannel"));
  v9 = v8 == 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003F074;
  v22[3] = &unk_1000DBAB8;
  v25 = 0;
  v26 = 0;
  v27 = v15;
  v28 = v17;
  v22[4] = self;
  v23 = v4;
  v29 = v15;
  v30 = v17;
  v24 = v7;
  v31 = v9;
  v18 = v7;
  v19 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 1, v22, v15, v17, v12));

  return v20;
}

- (id)_finalizeImageWithCoverImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v48;
  CGFloat v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double MinX;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  double v91;
  void *v92;
  uint64_t v94;
  double v95;
  double v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  id v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  v102 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feed"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "theme"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backingTag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "asChannel"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  v9 = objc_msgSend(v8, "punchThroughEffect");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sizeCategory"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v11, "size");
  v108 = v12;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v15, "cornerRadius");
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation options](self, "options"));
  objc_msgSend(v18, "scale");
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ne_color"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  objc_msgSend(v23, "materialBlurRadius");
  v25 = v24;

  v103 = v7;
  if (v22
    && (v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")),
        v27 = objc_msgSend(v22, "_isSimilarToColor:withinPercentage:", v26, 0.2),
        v26,
        (v27 & 1) == 0))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v31, "materialColorAlpha");
    v33 = v32;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "colorWithAlphaComponent:", v33));
    v30 = 0.5;
  }
  else if (v7)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.85));
    v30 = 1.4;
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.392156863, 0.27));
    v25 = 20.0;
    v30 = 1.1;
  }
  v34 = objc_msgSend((id)objc_opt_class(self, v28), "imageMaskOfSize:", v108, v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v105 = v6;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOperation _bannerImageForTheme:punchOutEffect:](self, "_bannerImageForTheme:punchOutEffect:", v6, v9));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "assetHandle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "filePath"));
  v39 = objc_msgSend(v38, "length");

  v100 = v20;
  v101 = v17;
  v98 = v30;
  v99 = v25;
  if (v39)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "assetHandle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "filePath"));

    if (v42)
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v42));
    else
      v43 = 0;
  }
  else
  {
    v43 = 0;
    v42 = 0;
  }
  objc_msgSend((id)objc_opt_class(self, v40), "bannerRectForSize:", v108, v14);
  x = v109.origin.x;
  y = v109.origin.y;
  width = v109.size.width;
  height = v109.size.height;
  v48 = CGRectGetWidth(v109);
  v110.origin.x = x;
  v110.origin.y = y;
  v110.size.width = width;
  v110.size.height = height;
  v49 = CGRectGetHeight(v110);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "attributedStringForTag:boundsSize:sizeCategory:", v107, v106, v108, v14));

  v104 = v14;
  if (v43)
  {
    objc_msgSend(v43, "size");
    v96 = v49;
    v53 = v52;
    objc_msgSend(v43, "size");
    v55 = v53 / fmax(v54, 1.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v56, "logoInsetsForBannerSize:logoAspectRatio:", width, height, v55);
    v57 = width;
    v58 = height;
    v59 = v48;
    v95 = v60;
    v62 = v61;
    v64 = v63;
    v65 = y;
    v67 = v66;

    v68 = v59 - v62;
    v69 = v58;
    v70 = v57;
    v71 = fmax(v68 - v67, 1.0);
    v72 = fmax(v96 - v95 - v64, 1.0);
    objc_msgSend(v43, "size");
    v74 = v73;
    objc_msgSend(v43, "size");
    if (v75 >= 1.0)
      v76 = v75;
    else
      v76 = 1.0;
    v77 = v74 / v76;
    v111.origin.x = x;
    v111.origin.y = v65;
    v111.size.width = v70;
    v111.size.height = v69;
    MinX = CGRectGetMinX(v111);
    v97 = v65;
    v112.origin.x = x;
    v112.origin.y = v65;
    v112.size.width = v70;
    v112.size.height = v69;
    v79 = CGRectGetWidth(v112);
    if (v77 <= v71 / v72)
    {
      v80 = round(v72 * v77);
      v81 = MinX + round((v79 - v80) * 0.5);
      v82 = x;
      v83 = v97;
      v84 = v70;
      v85 = v69;
    }
    else
    {
      v80 = v71;
      v81 = MinX + round((v79 - v71) * 0.5);
      v82 = x;
      v83 = v97;
      v84 = v70;
      v85 = v69;
      v72 = round(v71 / v77);
    }
    v89 = round((CGRectGetHeight(*(CGRect *)&v82) - v72) * 0.5);
  }
  else
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v86, "insetForFeed:sizeCategory:", v5, v106);
    v88 = v87;

    v113.origin.x = x;
    v113.origin.y = y;
    v113.size.width = width;
    v113.size.height = height;
    v114 = CGRectInset(v113, v48 * v88, 0.0);
    v115 = CGRectIntegral(v114);
    v81 = v115.origin.x;
    v89 = v115.origin.y;
    v80 = v115.size.width;
    v72 = v115.size.height;
  }
  v90 = v9;
  v91 = v99;
  if (!v103)
  {
    v81 = CGRectZero.origin.x;
    v89 = CGRectZero.origin.y;
    v80 = CGRectZero.size.width;
    v72 = CGRectZero.size.height;

    v51 = 0;
    v35 = 0;
    v29 = 0;
    v90 = 0;
    v91 = 0.0;
  }
  LOBYTE(v94) = 0;
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:", v29, v35, 0, v43, v51, v90, v91, v98, v108, v104, v100, *(_QWORD *)&v81, *(_QWORD *)&v89, *(_QWORD *)&v80, *(_QWORD *)&v72,
                    v101,
                    v94));

  return v92;
}

+ (id)imageMaskOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[7];

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maskLookupTable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = 0;
    if (width > 0.0 && height > 0.0)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10003FE44;
      v12[3] = &unk_1000DBAD8;
      v12[4] = a1;
      *(double *)&v12[5] = width;
      *(double *)&v12[6] = height;
      v9 = (id)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v12, width, height, 0.0));
      if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10007D70C();
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maskLookupTable"));
      objc_msgSend(v10, "setObject:forKey:", v9, v6);

    }
  }

  return v9;
}

+ (id)maskLookupTable
{
  if (qword_10010A550 != -1)
    dispatch_once(&qword_10010A550, &stru_1000DBAF8);
  return (id)qword_10010A548;
}

+ (CGRect)bannerRectForSize:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  CGRect result;

  width = a3.width;
  v4 = fmax(a3.height - a3.width, 0.0);
  v5 = a3.height - v4;
  v6 = 0.0;
  result.size.height = v4;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v6;
  return result;
}

- (FRFeedImageGenerationOptions)options
{
  return self->_options;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FCOperationCanceling)coverDownloadOperation
{
  return (FCOperationCanceling *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoverDownloadOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FCOperationCanceling)logoDownloadOperation
{
  return (FCOperationCanceling *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogoDownloadOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoDownloadOperation, 0);
  objc_storeStrong((id *)&self->_coverDownloadOperation, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
