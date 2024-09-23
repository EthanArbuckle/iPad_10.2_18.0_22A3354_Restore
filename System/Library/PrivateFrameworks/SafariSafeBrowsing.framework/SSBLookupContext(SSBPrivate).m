@implementation SSBLookupContext(SSBPrivate)

- (uint64_t)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB3D0;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(_QWORD *)&a1.__val_;
  *(_QWORD *)&a1.__val_ = a1.__cat_->__vftable;
  v2 = *(_QWORD *)(v1 + 8);
  v3 = a1.__cat_->__vftable;
  if (a1.__cat_->__vftable)
  {
    a1.__cat_ = (const std::error_category *)a1.__cat_[1].__vftable;
    nsErrorFromReplyErrorCode(a1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  if (v3)

}

- (_QWORD)_forceDatabaseUpdateWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB3D0;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB4F0;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  id v5;

  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB4F0;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_getDatabaseStatusWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB340;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getDatabaseStatusWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  _SSBDatabaseStatus *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void **v10;

  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  if (*(_QWORD *)&a3->__val_)
  {
    v4 = *(_QWORD *)(a1 + 8);
    nsErrorFromReplyErrorCode(*a3);
    v5 = (_SSBDatabaseStatus *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _SSBDatabaseStatus *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    v8 = v6;
    v9 = v7;
    v5 = -[_SSBDatabaseStatus initWithDatabaseStatus:]([_SSBDatabaseStatus alloc], "initWithDatabaseStatus:", &v8, 0, 0, 0);
    v10 = (void **)&v8;
    std::vector<SafeBrowsing::DatabaseStatus::Database>::__destroy_vector::operator()[abi:sn180100](&v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }

  *(_QWORD *)&v8 = &v6;
  std::vector<SafeBrowsing::DatabaseStatus::Database>::__destroy_vector::operator()[abi:sn180100]((void ***)&v8);
}

- (_QWORD)_getDatabaseStatusWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB340;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_getServiceStatusWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB2F8;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getServiceStatusWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  _SSBServiceStatus *v5;
  void *v6[2];
  uint64_t v7;
  int v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void *v13[2];
  uint64_t v14;
  void *v15[2];
  uint64_t v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void *__p[2];
  uint64_t v23;
  void **v24;

  *(_OWORD *)v6 = *(_OWORD *)a2;
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v8 = *(_DWORD *)(a2 + 24);
  v9 = *(_OWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  v11 = *(_OWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_OWORD *)v13 = *(_OWORD *)(a2 + 80);
  v14 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  if (*(_QWORD *)&a3->__val_)
  {
    v4 = *(_QWORD *)(a1 + 8);
    nsErrorFromReplyErrorCode(*a3);
    v5 = (_SSBServiceStatus *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _SSBServiceStatus *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v6;
    v16 = v7;
    HIBYTE(v7) = 0;
    v6[0] = 0;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    v10 = 0;
    v9 = 0uLL;
    v20 = v11;
    v21 = v12;
    v11 = 0uLL;
    v12 = 0;
    *(_OWORD *)__p = *(_OWORD *)v13;
    v23 = v14;
    v13[0] = 0;
    v13[1] = 0;
    v14 = 0;
    v5 = -[_SSBServiceStatus initWithServiceStatus:]([_SSBServiceStatus alloc], "initWithServiceStatus:", v15);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v24 = (void **)&v20;
    std::vector<SafeBrowsing::ServiceStatus::Connection>::__destroy_vector::operator()[abi:sn180100](&v24);
    v24 = (void **)&v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:sn180100](&v24);
    if (SHIBYTE(v16) < 0)
      operator delete(v15[0]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }

  if (v13[0])
  {
    v13[1] = v13[0];
    operator delete(v13[0]);
  }
  v15[0] = &v11;
  std::vector<SafeBrowsing::ServiceStatus::Connection>::__destroy_vector::operator()[abi:sn180100]((void ***)v15);
  v15[0] = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:sn180100]((void ***)v15);
  if (SHIBYTE(v7) < 0)
    operator delete(v6[0]);
}

- (_QWORD)_getServiceStatusWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB2F8;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB538;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  id v5;

  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB538;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB580;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  id v5;

  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB580;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB388;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  id v5;

  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_deleteAllDatabasesWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB388;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB418;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = *a2;
  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_fetchCellularDataPlanWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB418;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB460;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *a2;
  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(v4 / 1000000));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_getLastDatabaseUpdateTimeWithCompletionHandler:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB460;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)_getSafeBrowsingEnabledState:()SSBPrivate
{
  uint64_t result;

  *a2 = off_1EA3EB268;
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)_getSafeBrowsingEnabledState:()SSBPrivate
{
  uint64_t v4;
  id v5;

  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)_getSafeBrowsingEnabledState:()SSBPrivate
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = off_1EA3EB268;
  v2[1] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 8));
  return v2;
}

@end
