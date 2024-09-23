@implementation _PSPhotoSuggestionsOutstandingRequestsGuardedData

- (_PSPhotoSuggestionsOutstandingRequestsGuardedData)init
{
  _PSPhotoSuggestionsOutstandingRequestsGuardedData *v2;
  uint64_t v3;
  NSMutableDictionary *outstandingRequests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PSPhotoSuggestionsOutstandingRequestsGuardedData;
  v2 = -[_PSPhotoSuggestionsOutstandingRequestsGuardedData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = (NSMutableDictionary *)v3;

    v2->_waitingForRequestIDForCurrentThread = 0;
  }
  return v2;
}

- (uint64_t)outstandingRequests
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (BOOL)waitingForRequestIDForCurrentThread
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (uint64_t)setWaitingForRequestIDForCurrentThread:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
}

@end
