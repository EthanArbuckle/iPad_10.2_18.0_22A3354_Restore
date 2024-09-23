@implementation _PXMomentShareMockMomentShare

- (_PXMomentShareMockMomentShare)initWithStatus:(unsigned __int16)a3 assetCount:(unint64_t)a4 photosCount:(unint64_t)a5 videosCount:(unint64_t)a6 uploadedPhotosCount:(unint64_t)a7 uploadedVideosCount:(unint64_t)a8 shareURL:(id)a9 expiryDate:(id)a10 localizedTitle:(id)a11 startDate:(id)a12 endDate:(id)a13
{
  id v18;
  id v19;
  __CFString *v20;
  id v21;
  id v22;
  _PXMomentShareMockMomentShare *v23;
  _PXMomentShareMockMomentShare *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  objc_super v33;

  v18 = a9;
  v19 = a10;
  v20 = (__CFString *)a11;
  v21 = a12;
  v22 = a13;
  v33.receiver = self;
  v33.super_class = (Class)_PXMomentShareMockMomentShare;
  v23 = -[_PXMomentShareMockMomentShare init](&v33, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_status = a3;
    v23->_assetCount = a4;
    v23->_photosCount = a5;
    v23->_videosCount = a6;
    v23->_uploadedPhotosCount = a7;
    v23->_uploadedVideosCount = a8;
    v25 = v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E5149688);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v24->_shareURL, v25);
    if (!v18)

    v26 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v24->_expiryDate, v26);
    if (!v19)

    if (v20)
      v27 = v20;
    else
      v27 = &stru_1E5149688;
    objc_storeStrong((id *)&v24->_localizedTitle, v27);
    v28 = v21;
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v24->_startDate, v28);
    if (!v21)

    v29 = v22;
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v24->_endDate, v29);
    if (!v22)

    v24->_estimatedAssetCount = a4;
    v24->_px_highlightKind = -1;
  }

  return v24;
}

- (NSString)uuid
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%p"), v5, self);

  return (NSString *)v6;
}

- (int64_t)aggregateMediaType
{
  unint64_t v3;
  unint64_t v4;
  int64_t result;

  v3 = -[_PXMomentShareMockMomentShare photosCount](self, "photosCount");
  v4 = -[_PXMomentShareMockMomentShare videosCount](self, "videosCount");
  result = -[_PXMomentShareMockMomentShare assetCount](self, "assetCount");
  if (result)
  {
    if (v4 || v3 != result)
    {
      if (v4 == result && v3 == 0)
        return 2;
      else
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (int64_t)px_momentShareType
{
  int v2;
  void *v4;
  void *v5;

  v2 = -[_PXMomentShareMockMomentShare status](self, "status");
  if ((v2 - 2) < 2)
    return 1;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_PXMomentShareMockMomentShare px_momentShareType]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXMomentShareStatusMock.m"), 486, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 499, CFSTR("not implemented yet"));

  abort();
}

- (unsigned)status
{
  return self->_status;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (unint64_t)photosCount
{
  return self->_photosCount;
}

- (unint64_t)videosCount
{
  return self->_videosCount;
}

- (unint64_t)uploadedPhotosCount
{
  return self->_uploadedPhotosCount;
}

- (unint64_t)uploadedVideosCount
{
  return self->_uploadedVideosCount;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)localizedLocationNames
{
  return self->_localizedLocationNames;
}

- (unint64_t)estimatedAssetCount
{
  return self->_estimatedAssetCount;
}

- (unsigned)px_highlightEnrichmentState
{
  return self->_px_highlightEnrichmentState;
}

- (int64_t)px_highlightKind
{
  return self->_px_highlightKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLocationNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

+ (_PXMomentShareMockMomentShare)momentShareWithStatus:(unsigned __int16)a3 photosCount:(unint64_t)a4 videosCount:(unint64_t)a5 uploadedPhotosCount:(unint64_t)a6 uploadedVideosCount:(unint64_t)a7
{
  return -[_PXMomentShareMockMomentShare initWithStatus:assetCount:photosCount:videosCount:uploadedPhotosCount:uploadedVideosCount:shareURL:expiryDate:localizedTitle:startDate:endDate:]([_PXMomentShareMockMomentShare alloc], "initWithStatus:assetCount:photosCount:videosCount:uploadedPhotosCount:uploadedVideosCount:shareURL:expiryDate:localizedTitle:startDate:endDate:", a3, a5 + a4, a4, a5, a6, a7, 0, 0, 0, 0, 0);
}

@end
