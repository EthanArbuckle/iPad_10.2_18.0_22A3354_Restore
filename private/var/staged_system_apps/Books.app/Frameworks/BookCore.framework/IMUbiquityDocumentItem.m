@implementation IMUbiquityDocumentItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v16 = objc_opt_class(self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem url](self, "url"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IMUbiquityDocumentItem isLocal](self, "isLocal")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IMUbiquityDocumentItem isNotLocal](self, "isNotLocal")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IMUbiquityDocumentItem isUploading](self, "isUploading")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IMUbiquityDocumentItem isUploaded](self, "isUploaded")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IMUbiquityDocumentItem isDownloading](self, "isDownloading")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem downloadingPercent](self, "downloadingPercent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem uploadingPercent](self, "uploadingPercent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem uploadingError](self, "uploadingError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem unresolvedConflict](self, "unresolvedConflict"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem contentChangedDate](self, "contentChangedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem contentCreationDate](self, "contentCreationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentItem contentFileSize](self, "contentFileSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) \n\t url : %@ \n\t isLocal : %@ \n\t isNotLocal : %@ \n\t isUploading : %@ \n\t isUploaded : %@ \n\t isDownloading : %@ \n\t downloadingPercent : %@ \n\t uploadingPercent : %@ \n\t uploadingError : %@ \n\t unresolvedConflict : %@ \n\t contentChangedDate : %@ \n\t contentCreationDate : %@ \n\t contentFileSize : %@ "), v16, self, v15, v18, v14, v17, v13, v3, v12, v4, v5, v6, v7, v8, v9));

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isNotLocal
{
  return self->_isNotLocal;
}

- (void)setIsNotLocal:(BOOL)a3
{
  self->_isNotLocal = a3;
}

- (BOOL)isUploading
{
  return self->_isUploading;
}

- (void)setIsUploading:(BOOL)a3
{
  self->_isUploading = a3;
}

- (BOOL)isUploaded
{
  return self->_isUploaded;
}

- (void)setIsUploaded:(BOOL)a3
{
  self->_isUploaded = a3;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (void)setIsDownloading:(BOOL)a3
{
  self->_isDownloading = a3;
}

- (NSNumber)downloadingPercent
{
  return self->_downloadingPercent;
}

- (void)setDownloadingPercent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)uploadingPercent
{
  return self->_uploadingPercent;
}

- (void)setUploadingPercent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)uploadingError
{
  return self->_uploadingError;
}

- (void)setUploadingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)unresolvedConflict
{
  return self->_unresolvedConflict;
}

- (void)setUnresolvedConflict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)contentChangedDate
{
  return self->_contentChangedDate;
}

- (void)setContentChangedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (void)setContentCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)contentFileSize
{
  return self->_contentFileSize;
}

- (void)setContentFileSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFileSize, 0);
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_contentChangedDate, 0);
  objc_storeStrong((id *)&self->_unresolvedConflict, 0);
  objc_storeStrong((id *)&self->_uploadingError, 0);
  objc_storeStrong((id *)&self->_uploadingPercent, 0);
  objc_storeStrong((id *)&self->_downloadingPercent, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
