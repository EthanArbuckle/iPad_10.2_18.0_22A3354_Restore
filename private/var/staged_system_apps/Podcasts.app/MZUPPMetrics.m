@implementation MZUPPMetrics

- (id)metricsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  _QWORD v28[6];
  _QWORD v29[6];

  v28[0] = CFSTR("success");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MZUPPMetrics success](self, "success")));
  v29[0] = v3;
  v28[1] = CFSTR("synctaskfailingsubtask");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MZUPPMetrics latestUPPSubtask](self, "latestUPPSubtask")));
  v29[1] = v4;
  v28[2] = CFSTR("numlocalitems");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MZUPPMetrics numMetadataItemsFromDataSource](self, "numMetadataItemsFromDataSource")));
  v29[2] = v5;
  v28[3] = CFSTR("numremoteitems");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MZUPPMetrics numMetadataItemsFromKVSStorage](self, "numMetadataItemsFromKVSStorage")));
  v29[3] = v6;
  v28[4] = CFSTR("numitemstocommitlocally");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MZUPPMetrics numMetadataItemsToCommitToDataSource](self, "numMetadataItemsToCommitToDataSource")));
  v29[4] = v7;
  v28[5] = CFSTR("numitemstocommitremotely");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MZUPPMetrics numMetadataItemsToCommitToKVSStorage](self, "numMetadataItemsToCommitToKVSStorage")));
  v29[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPMetrics errorDomain](self, "errorDomain"));
  if (v11)
  {

LABEL_4:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPMetrics errorDomain](self, "errorDomain"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("errordomain"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MZUPPMetrics errorCode](self, "errorCode")));
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("errorcode"));

    goto LABEL_5;
  }
  if (-[MZUPPMetrics errorCode](self, "errorCode"))
    goto LABEL_4;
LABEL_5:
  -[MZUPPMetrics bagLookupStartTime](self, "bagLookupStartTime");
  if (v14 != 0.0)
  {
    -[MZUPPMetrics bagLookupEndTime](self, "bagLookupEndTime");
    if (v15 != 0.0)
    {
      -[MZUPPMetrics bagLookupEndTime](self, "bagLookupEndTime");
      v17 = v16;
      -[MZUPPMetrics bagLookupStartTime](self, "bagLookupStartTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17 - v18));
      objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("bagloadduration"));

    }
  }
  -[MZUPPMetrics syncTaskStartTime](self, "syncTaskStartTime");
  if (v20 != 0.0)
  {
    -[MZUPPMetrics syncTaskEndTime](self, "syncTaskEndTime");
    if (v21 != 0.0)
    {
      -[MZUPPMetrics syncTaskEndTime](self, "syncTaskEndTime");
      v23 = v22;
      -[MZUPPMetrics syncTaskStartTime](self, "syncTaskStartTime");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 - v24));
      objc_msgSend(v10, "setObject:forKey:", v25, CFSTR("synctaskduration"));

    }
  }
  v26 = objc_msgSend(v10, "copy");

  return v26;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (unint64_t)latestUPPSubtask
{
  return self->_latestUPPSubtask;
}

- (void)setLatestUPPSubtask:(unint64_t)a3
{
  self->_latestUPPSubtask = a3;
}

- (int64_t)numMetadataItemsFromDataSource
{
  return self->_numMetadataItemsFromDataSource;
}

- (void)setNumMetadataItemsFromDataSource:(int64_t)a3
{
  self->_numMetadataItemsFromDataSource = a3;
}

- (int64_t)numMetadataItemsFromKVSStorage
{
  return self->_numMetadataItemsFromKVSStorage;
}

- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3
{
  self->_numMetadataItemsFromKVSStorage = a3;
}

- (int64_t)numMetadataItemsToCommitToDataSource
{
  return self->_numMetadataItemsToCommitToDataSource;
}

- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3
{
  self->_numMetadataItemsToCommitToDataSource = a3;
}

- (int64_t)numMetadataItemsToCommitToKVSStorage
{
  return self->_numMetadataItemsToCommitToKVSStorage;
}

- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3
{
  self->_numMetadataItemsToCommitToKVSStorage = a3;
}

- (double)bagLookupStartTime
{
  return self->_bagLookupStartTime;
}

- (void)setBagLookupStartTime:(double)a3
{
  self->_bagLookupStartTime = a3;
}

- (double)bagLookupEndTime
{
  return self->_bagLookupEndTime;
}

- (void)setBagLookupEndTime:(double)a3
{
  self->_bagLookupEndTime = a3;
}

- (double)syncTaskStartTime
{
  return self->_syncTaskStartTime;
}

- (void)setSyncTaskStartTime:(double)a3
{
  self->_syncTaskStartTime = a3;
}

- (double)syncTaskEndTime
{
  return self->_syncTaskEndTime;
}

- (void)setSyncTaskEndTime:(double)a3
{
  self->_syncTaskEndTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
