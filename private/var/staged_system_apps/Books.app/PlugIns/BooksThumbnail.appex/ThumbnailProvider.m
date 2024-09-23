@implementation ThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  double v47;
  double v48;
  id v49;
  _BYTE buf[12];
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;

  v5 = a3;
  v44 = a4;
  v6 = BooksThumbsLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileURL"));
  objc_msgSend(v5, "maximumSize");
  if (v9 < 8.0)
    v9 = 8.0;
  v11 = fmin(v9, 1024.0);
  if (v10 >= 8.0)
    v12 = v10;
  else
    v12 = 8.0;
  v13 = fmin(v12, 1024.0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    v51 = 2048;
    v52 = v11;
    v53 = 2048;
    v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "provideThumbnailForFileRequest for URL: %{public}@ size: %f,%f", buf, 0x20u);
  }
  if (+[BUZipFileArchive isZipArchiveAtURL:error:](BUZipFileArchive, "isZipArchiveAtURL:error:", v8, 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist purchasesRepositoryPath](IMLibraryPlist, "purchasesRepositoryPath"));
    v15 = v7;
    v16 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    *(_QWORD *)buf = 0;
    v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, buf);
    v19 = *(id *)buf;

    if ((v18 & 1) == 0 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100003320();

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bu_nonCollidingNameForFileName:inDestPath:", v21, v16));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23));

    v49 = 0;
    v25 = +[BUZipFileArchive extractArchiveFromURL:toURL:options:error:](BUZipFileArchive, "extractArchiveFromURL:toURL:options:error:", v8, v24, 0, &v49);
    v26 = v49;
    if (v25)
    {
      v27 = sub_100002E84(v15, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v29, "removeItemAtURL:error:", v24, 0);

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v30 = sub_100002E84(v7, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v26 = 0;
  }
  if (v28)
  {
    v31 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v28);
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "size");
      v35 = v33;
      v36 = v34;
      if (v33 <= v11 && v34 <= v13)
        goto LABEL_39;
      if (v11 == 0.0 || v33 == 0.0 || v34 == 0.0 || v13 == 0.0)
      {
        v40 = BooksThumbsLog();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          sub_1000032E0(v41);

      }
      else
      {
        if (v33 / v34 > v11 / v13)
        {
          v36 = v34 * (v11 / v33);
          v35 = v11;
LABEL_39:
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_100003220;
          v45[3] = &unk_1000041D8;
          v38 = v32;
          v46 = v38;
          v47 = v35;
          v48 = v36;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[QLThumbnailReply replyWithContextSize:currentContextDrawingBlock:](QLThumbnailReply, "replyWithContextSize:currentContextDrawingBlock:", v45, v35, v36));

          goto LABEL_40;
        }
        if (v33 / v34 < v11 / v13)
        {
          v35 = v33 * (v13 / v34);
LABEL_38:
          v36 = v13;
          goto LABEL_39;
        }
      }
      v35 = v11;
      goto LABEL_38;
    }
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100003280();
  v38 = 0;
  v39 = 0;
LABEL_40:
  v42 = objc_retainBlock(v44);
  v43 = v42;
  if (v42)
    (*((void (**)(id, void *, id))v42 + 2))(v42, v39, v26);

}

@end
