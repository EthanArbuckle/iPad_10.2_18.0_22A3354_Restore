@implementation SETransceiveHelper

- (SETransceiveHelper)initWithSEController:(shared_ptr<SEUpdater::P73BaseSEController>)a3
{
  P73BaseSEController *ptr;
  SETransceiveHelper *v4;
  SETransceiveHelper *v5;
  uint64_t v6;
  NSMutableArray *capduRecord;
  uint64_t v8;
  NSMutableArray *rapduRecord;
  objc_super v11;

  ptr = a3.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)SETransceiveHelper;
  v4 = -[SETransceiveHelper init](&v11, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    std::shared_ptr<SEUpdater::P73BaseSEController>::operator=[abi:ne180100](&v4->_fSeController.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    capduRecord = v5->_capduRecord;
    v5->_capduRecord = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    rapduRecord = v5->_rapduRecord;
    v5->_rapduRecord = (NSMutableArray *)v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[SETransceiveHelper dealloc]", CFSTR("Releasing transceiver wrapper\n"));
  v3.receiver = self;
  v3.super_class = (Class)SETransceiveHelper;
  -[SETransceiveHelper dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[SETransceiveHelper invalidate]", CFSTR("Invalidating transceiver wrapper\n"));
  cntrl = self->_fSeController.__cntrl_;
  self->_fSeController.__ptr_ = 0;
  self->_fSeController.__cntrl_ = 0;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id)selectWithAID:(id)a3
{
  id v4;
  void *v5;
  NSError *v6;
  NSError *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v19;
  _QWORD *v20;
  std::__shared_weak_count *v21;
  void *v22;
  std::__shared_weak_count *v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithHexString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 0, 164, 4, 0, v5);

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v19, 0x2037uLL);
  v19 = &unk_24E0BF828;
  -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v22, &v19);
  v6 = (NSError *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    _ObjCLogNSError(v6, 0, "-[SETransceiveHelper selectWithAID:]", CFSTR("Error encountered when transceiving select %@\n"), v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v8;
    goto LABEL_9;
  }
  v9 = v20[1];
  if ((unint64_t)(v9 - *v20) < 2)
  {
    v10 = 43947;
LABEL_7:
    _ObjCLogNSError(0, 0, "-[SETransceiveHelper selectWithAID:]", CFSTR("Bad SW 0x%x received in select %@\n"), v10, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v10 = *(unsigned __int8 *)(v9 - 1) | (*(unsigned __int8 *)(v9 - 2) << 8);
  if ((_DWORD)v10 != 36864)
    goto LABEL_7;
  v11 = 0;
LABEL_9:

  v19 = &unk_24E0BF880;
  v12 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v22 = &unk_24E0BF880;
  v15 = v23;
  if (v23)
  {
    v16 = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  return v11;
}

- (id)copySeid:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSData *v15;
  NSData *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSData *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  std::__shared_weak_count *v38;
  void *v39;
  std::__shared_weak_count *v40;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithHexString:", CFSTR("DF21"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 202, 0, 254, v5);

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v36, 0x2037uLL);
  v36 = &unk_24E0BF828;
  -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v39, &v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    _ObjCLogWrapOutError(a3, v10, 0, "-[SETransceiveHelper copySeid:]", CFSTR("Error encountered when transceiving copy SEID \n"), v7, v8, v9, v35);
    v11 = 0;
    goto LABEL_14;
  }
  v12 = v37[1];
  v13 = v12 - *v37;
  if (v13 < 2)
  {
    v14 = 43947;
LABEL_9:
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copySeid:]", CFSTR("Bad SW 0x%x received in copy SEID\n"), v6, v7, v8, v9, v14);
    v11 = 0;
    goto LABEL_14;
  }
  v14 = *(unsigned __int8 *)(v12 - 1) | (*(unsigned __int8 *)(*v37 + v13 - 2) << 8);
  if ((_DWORD)v14 != 36864)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  DERDecodeData(v15, 0xE00000000000001ELL);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  v21 = v16;
  if (v16)
  {
    DERDecodeData(v16, 0xC000000000000021);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;
    if (v22)
      v27 = v22;
    else
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copySeid:]", CFSTR("Error encountered when decoding tag 0xDF21\n"), v23, v24, v25, v26, v35);

  }
  else
  {
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copySeid:]", CFSTR("Error encountered when decoding tag 0xFE\n"), v17, v18, v19, v20, v35);
    v11 = 0;
  }

LABEL_14:
  v36 = &unk_24E0BF880;
  v28 = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v39 = &unk_24E0BF880;
  v31 = v40;
  if (v40)
  {
    v32 = (unint64_t *)&v40->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  return v11;
}

- (id)copyCasdCert:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t *v22;
  unint64_t v23;
  NSData *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  void *v67;
  _QWORD *v68;
  std::__shared_weak_count *v69;
  void *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  __int128 v73;
  __int128 v74;
  void *v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  __int128 v78;
  __int128 v79;
  void *v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  __int128 v83;
  __int128 v84;

  -[SETransceiveHelper selectWithAID:](self, "selectWithAID:", CFSTR("A00000015153504341534400"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    v10 = 0;
    _ObjCLogWrapOutError(a3, v5, 0, "-[SETransceiveHelper copyCasdCert:]", CFSTR("While selecting CASD\n"), v6, v7, v8, v62);
    goto LABEL_3;
  }
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v80);
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v75);
  if (*((_BYTE *)self->_fSeController.__ptr_ + 16))
  {
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 202, 127, 33, 0);
    std::shared_ptr<std::vector<unsigned char>>::operator=[abi:ne180100](&v81, &v71);
    v83 = v73;
    v84 = v74;
    v70 = &unk_24E0BF880;
    v12 = v72;
    if (v72)
    {
      p_shared_owners = (unint64_t *)&v72->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 192, 0, 0, 0);
    std::shared_ptr<std::vector<unsigned char>>::operator=[abi:ne180100](&v76, &v71);
    v78 = v73;
    v79 = v74;
    v70 = &unk_24E0BF880;
    v15 = v72;
    if (!v72)
      goto LABEL_24;
    v16 = (unint64_t *)&v72->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
  }
  else
  {
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 202, 127, 33, 0);
    std::shared_ptr<std::vector<unsigned char>>::operator=[abi:ne180100](&v81, &v71);
    v83 = v73;
    v84 = v74;
    v70 = &unk_24E0BF880;
    v18 = v72;
    if (v72)
    {
      v19 = (unint64_t *)&v72->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 204, 127, 33, 0);
    std::shared_ptr<std::vector<unsigned char>>::operator=[abi:ne180100](&v76, &v71);
    v78 = v73;
    v79 = v74;
    v70 = &unk_24E0BF880;
    v15 = v72;
    if (!v72)
      goto LABEL_24;
    v21 = (unint64_t *)&v72->__shared_owners_;
    do
      v17 = __ldaxr(v21);
    while (__stlxr(v17 - 1, v21));
  }
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_24:
  v71 = v81;
  v72 = v82;
  if (v82)
  {
    v22 = (unint64_t *)&v82->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  v70 = &unk_24E0BF960;
  v73 = v83;
  v74 = v84;
  v24 = (NSData *)objc_opt_new();
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v67, 0x2037uLL);
  v25 = 0;
  v67 = &unk_24E0BF828;
  do
  {
    -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v70, &v67);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = 0;
      _ObjCLogWrapOutError(a3, v9, 0, "-[SETransceiveHelper copyCasdCert:]", CFSTR("Error encountered when transceiving copyCasdCert\n"), v27, v28, v29, v62);
      goto LABEL_50;
    }
    v30 = v68[1];
    v31 = v30 - *v68;
    if (v31 < 2)
    {
      v33 = 43947;
LABEL_41:
      v10 = 0;
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", CFSTR("Bad SW 0x%x received\n"), v26, v27, v28, v29, v33);
      goto LABEL_50;
    }
    v32 = *(unsigned __int8 *)(*v68 + v31 - 2);
    if ((v32 & 0xFFFFFFFD) != 0x61)
    {
      v33 = *(unsigned __int8 *)(v30 - 1) | (v32 << 8);
      if ((_DWORD)v33 != 36864)
        goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v25 & 1) == 0)
    {
      std::shared_ptr<std::vector<unsigned char>>::operator=[abi:ne180100](&v71, &v76);
      v73 = v78;
      v74 = v79;
    }
    -[NSData appendData:](v24, "appendData:", v34);

    if (v68[1] - *v68 < 2uLL)
      break;
    v25 = 1;
  }
  while ((*(_BYTE *)(v68[1] - 2) & 0xFD) == 0x61);
  if (!*((_BYTE *)self->_fSeController.__ptr_ + 16))
    goto LABEL_44;
  v24 = objc_retainAutorelease(v24);
  v66[0] = -[NSData bytes](v24, "bytes");
  v66[1] = -[NSData length](v24, "length");
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v35 = DERDecodeItem((uint64_t)v66, &v63);
  if (!(_DWORD)v35)
  {
    if (v63 != 0x6000000000000021)
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", CFSTR("Unexpected top level tag 0x%X expected 0x%X\n"), v36, v37, v38, v39, (unsigned __int16)v63);
      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v64, v65);
    v40 = objc_claimAutoreleasedReturnValue();

    v24 = (NSData *)v40;
LABEL_44:
    splitDERSeq(v24, 0x6000000000000021);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v41;
    if (v41)
    {
      v47 = (void *)MEMORY[0x24BDBCEC8];
      objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "dataWithData:", v48);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "objectAtIndexedSubscript:", 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendData:", v49);

    }
    else
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", CFSTR("Unable to split certificates\n"), v42, v43, v44, v45, v62);
      v10 = 0;
    }

    goto LABEL_50;
  }
  _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", CFSTR("Failed to decode top level 7F21 dr %d\n"), v36, v37, v38, v39, v35);
LABEL_49:
  v10 = 0;
LABEL_50:
  v67 = &unk_24E0BF880;
  v50 = v69;
  if (v69)
  {
    v51 = (unint64_t *)&v69->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }

  v70 = &unk_24E0BF880;
  v53 = v72;
  if (v72)
  {
    v54 = (unint64_t *)&v72->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  v75 = &unk_24E0BF880;
  v56 = v77;
  if (v77)
  {
    v57 = (unint64_t *)&v77->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v80 = &unk_24E0BF880;
  v59 = v82;
  if (v82)
  {
    v60 = (unint64_t *)&v82->__shared_owners_;
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
LABEL_3:

  return v10;
}

- (int64_t)copyDeviceType:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSData *v15;
  NSData *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  void *v45;
  std::__shared_weak_count *v46;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithHexString:", CFSTR("DF31"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 202, 0, 254, v5);

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v42, 0x2037uLL);
  v42 = &unk_24E0BF828;
  -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v45, &v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (v6)
  {
    _ObjCLogWrapOutError(a3, v6, 0, "-[SETransceiveHelper copyDeviceType:]", CFSTR("Could not copy device type with error %@\n"), v8, v9, v10, (uint64_t)v6);
  }
  else
  {
    v12 = v43[1];
    v13 = v12 - *v43;
    if (v13 >= 2)
    {
      v14 = *(unsigned __int8 *)(v12 - 1) | (*(unsigned __int8 *)(*v43 + v13 - 2) << 8);
      if ((_DWORD)v14 == 36864)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v15 = (NSData *)objc_claimAutoreleasedReturnValue();
        DERDecodeData(v15, 0xE00000000000001ELL);
        v16 = (NSData *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          DERDecodeData(v16, 0xC000000000000031);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v21;
          if (v21)
          {
            objc_msgSend(v21, "subdataWithRange:", 7, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              v29 = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v27), "bytes");
            }
            else
            {
              objc_msgSend(v26, "asHexString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", CFSTR("Encountered error when retrieving seDeviceTypeData from %@\n"), v38, v39, v40, v41, (uint64_t)v37);

              v29 = 255;
            }

          }
          else
          {
            _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", CFSTR("Encountered error when decoding top level 0x%llx\n"), v22, v23, v24, v25, 0xC000000000000031);
            v29 = 255;
          }

        }
        else
        {
          _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", CFSTR("Encountered error when decoding top level 0x%llx\n"), v17, v18, v19, v20, 0xE00000000000001ELL);
          v29 = 255;
        }

        goto LABEL_12;
      }
    }
    else
    {
      v14 = 43947;
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", CFSTR("Bad SW received when copying device type 0x%x\n"), v7, v8, v9, v10, v14);
  }
  v29 = 255;
LABEL_12:

  v42 = &unk_24E0BF880;
  v30 = v44;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v32 = __ldaxr(p_shared_owners);
    while (__stlxr(v32 - 1, p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v45 = &unk_24E0BF880;
  v33 = v46;
  if (v46)
  {
    v34 = (unint64_t *)&v46->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  return v29;
}

- (id)copyA9Parameters:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSData *v20;
  NSData *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSData *v41;
  NSData *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  std::__shared_weak_count *v64;
  void *v65;
  uint64_t *v66;
  std::__shared_weak_count *v67;
  void *v68;
  std::__shared_weak_count *v69;
  _QWORD v70[3];

  v70[2] = *MEMORY[0x24BDAC8D0];
  -[SETransceiveHelper selectWithAID:](self, "selectWithAID:", CFSTR("A0000001515350414141504C"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    v10 = 0;
    _ObjCLogWrapOutError(a3, v5, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Error encountered when selecting Star SD %@\n"), v6, v7, v8, (uint64_t)v5);
    goto LABEL_3;
  }
  +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 202, 127, 33, 0);
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v65, 0x2037uLL);
  v65 = &unk_24E0BF828;
  -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v68, &v65);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v12)
  {
    _ObjCLogWrapOutError(a3, v12, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Error encountered when getting cert SN %@\n"), v14, v15, v16, (uint64_t)v12);
    v10 = 0;
    goto LABEL_34;
  }
  v17 = v66[1];
  v18 = v17 - *v66;
  if (v18 < 2)
  {
    v19 = 43947;
LABEL_13:
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Bad SW encountered when gettng cert SN 0x%x\n"), v13, v14, v15, v16, v19);
    v9 = 0;
    v10 = 0;
    goto LABEL_34;
  }
  v19 = *(unsigned __int8 *)(v17 - 1) | (*(unsigned __int8 *)(*v66 + v18 - 2) << 8);
  if ((_DWORD)v19 != 36864)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  v20 = (NSData *)objc_claimAutoreleasedReturnValue();
  DERDecodeData(v20, 0x6000000000000021);
  v21 = (NSData *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    DERDecodeData(v21, 0x8000000000000013);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Error encountered when decoding cert SN\n"), v26, v27, v28, v29, v62);
      v9 = 0;
      v10 = 0;
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithHexString:", CFSTR("DF30"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 202, 0, 254, v31);

    -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v63, &v65);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v32;
    if (v32)
    {
      _ObjCLogWrapOutError(a3, v32, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Error encountered when getting OBKG %@\n"), v34, v35, v36, (uint64_t)v32);
      v10 = 0;
      goto LABEL_27;
    }
    v38 = *v66;
    v37 = v66[1];
    v39 = v37 - *v66;
    if (v39 >= 2)
    {
      v40 = *(unsigned __int8 *)(v37 - 1) | (*(unsigned __int8 *)(v39 + v38 - 2) << 8);
      if ((_DWORD)v40 == 36864)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v38, SERestoreInfo::RApdu::getDataSize((SERestoreInfo::RApdu *)&v65));
        v41 = (NSData *)objc_claimAutoreleasedReturnValue();
        DERDecodeData(v41, 0xE00000000000001ELL);
        v42 = (NSData *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          DERDecodeData(v42, 0xC000000000000030);
          v47 = objc_claimAutoreleasedReturnValue();
          v52 = (void *)v47;
          if (v47)
          {
            v70[0] = v30;
            v70[1] = v47;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Unable to construct obkg data\n"), v48, v49, v50, v51, v62);
            v10 = 0;
          }

        }
        else
        {
          _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Unable to decode top level 0x%llx\n"), v43, v44, v45, v46, 0xE00000000000001ELL);
          v10 = 0;
        }

LABEL_27:
        v63 = &unk_24E0BF880;
        v53 = v64;
        if (v64)
        {
          p_shared_owners = (unint64_t *)&v64->__shared_owners_;
          do
            v55 = __ldaxr(p_shared_owners);
          while (__stlxr(v55 - 1, p_shared_owners));
          if (!v55)
          {
            ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
            std::__shared_weak_count::__release_weak(v53);
          }
        }
        goto LABEL_32;
      }
    }
    else
    {
      v40 = 43947;
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Bad SW encountered when gettng OBKG 0x%x\n"), v33, v34, v35, v36, v40);
    v10 = 0;
    goto LABEL_27;
  }
  _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", CFSTR("Error encountered when decoding top level 0x%llx\n"), v22, v23, v24, v25, 0x6000000000000021);
  v9 = 0;
  v10 = 0;
LABEL_33:

LABEL_34:
  v65 = &unk_24E0BF880;
  v56 = v67;
  if (v67)
  {
    v57 = (unint64_t *)&v67->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v68 = &unk_24E0BF880;
  v59 = v69;
  if (v69)
  {
    v60 = (unint64_t *)&v69->__shared_owners_;
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
LABEL_3:

  return v10;
}

- (id)copySESignature:(id)a3 hsmChallengeSE:(id)a4 ecid:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  std::__shared_weak_count *v43;
  void *v44;
  std::__shared_weak_count *v45;
  uint64_t v46;
  _OWORD v47[2];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SETransceiveHelper selectWithAID:](self, "selectWithAID:", CFSTR("A00000015153504341534400"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "appendData:", v10);
    objc_msgSend(v18, "appendData:", v11);
    v46 = 0;
    objc_msgSend(v12, "getValue:", &v46);
    objc_msgSend(v18, "appendU64LE:", v46);
    memset(v47, 0, sizeof(v47));
    v19 = objc_retainAutorelease(v18);
    objc_msgSend(v19, "bytes");
    objc_msgSend(v19, "length");
    v20 = AMSupportDigestSha256();
    if ((_DWORD)v20)
    {
      _ObjCLogOutError((uint64_t *)a6, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", CFSTR("Unable to get AM Digest with error code %d\n"), v21, v22, v23, v24, v20);
      v16 = 0;
      v17 = 0;
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v47, 32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 0, 136, 240, 3, v26);

    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v41, 0x2037uLL);
    v41 = &unk_24E0BF828;
    -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v44, &v41);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      _ObjCLogWrapOutError(a6, v16, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", CFSTR("Error encountered when transceiving copy SE Signature \n"), v28, v29, v30, v40);
      v17 = 0;
      goto LABEL_14;
    }
    v31 = v42[1];
    v32 = v31 - *v42;
    if (v32 >= 2)
    {
      v33 = *(unsigned __int8 *)(v31 - 1) | (*(unsigned __int8 *)(*v42 + v32 - 2) << 8);
      if ((_DWORD)v33 == 36864)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else
    {
      v33 = 43947;
    }
    _ObjCLogOutError((uint64_t *)a6, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", CFSTR("Bad SW 0x%x received in copy SE Signature\n"), v27, v28, v29, v30, v33);
    v17 = 0;
LABEL_14:
    v41 = &unk_24E0BF880;
    v34 = v43;
    if (v43)
    {
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      do
        v36 = __ldaxr(p_shared_owners);
      while (__stlxr(v36 - 1, p_shared_owners));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    v44 = &unk_24E0BF880;
    v37 = v45;
    if (v45)
    {
      v38 = (unint64_t *)&v45->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    goto LABEL_5;
  }
  v17 = 0;
  _ObjCLogWrapOutError(a6, v16, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", CFSTR("Failed to select CASD\n"), v13, v14, v15, v40);
LABEL_6:

  return v17;
}

- (id)crsGetSharingRequestWithError:(id *)a3
{
  P73BaseSEController *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD v29[2];
  std::__shared_weak_count *v30;
  uint64_t *v31;
  _QWORD *v32;
  std::__shared_weak_count *v33;

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v31, 0x2037uLL);
  v31 = (uint64_t *)&unk_24E0BF828;
  ptr = self->_fSeController.__ptr_;
  SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)v29);
  v10 = SEUpdater::P73BaseSEController::transceive((uint64_t)ptr, (uint64_t)v29, &v31, 0, (SEUpdaterUtil::SELogObj *)2, 1);
  v29[0] = &unk_24E0BF880;
  v11 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v32[1];
  if ((_DWORD)v10
    || (unint64_t)(v14 - *v32) < 2
    || (*(unsigned __int8 *)(v14 - 1) | (*(unsigned __int8 *)(v14 - 2) << 8)) != 0x9000)
  {
    _ObjCLogOutError((uint64_t *)a3, 14, "-[SETransceiveHelper crsGetSharingRequestWithError:]", CFSTR("Failed to select CRS %d 0x%hx\n"), v6, v7, v8, v9, v10);
    v21 = 0;
  }
  else
  {
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 229, 0, 0, 0);
    -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", v29, &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v32[1];
      if ((unint64_t)(v19 - *v32) < 2)
        v20 = 43947;
      else
        v20 = *(unsigned __int8 *)(v19 - 1) | (*(unsigned __int8 *)(v19 - 2) << 8);
      _ObjCLogWrapOutError(a3, v18, 0, "-[SETransceiveHelper crsGetSharingRequestWithError:]", CFSTR("Bad SW 0x%x received in get sharing request\n"), v15, v16, v17, v20);
      v21 = 0;
    }
    else
    {
      if (v32[1] - *v32 <= 1uLL)
        __assert_rtn("getDataSize", "Apdu.hpp", 382, "len >= 2");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v29[0] = &unk_24E0BF880;
    v26 = v30;
    if (v30)
    {
      v27 = (unint64_t *)&v30->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
  v31 = (uint64_t *)&unk_24E0BF880;
  v22 = v33;
  if (v33)
  {
    v23 = (unint64_t *)&v33->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  return v21;
}

- (BOOL)crsSetSharingResult:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void *v28;
  uint64_t *v29;
  std::__shared_weak_count *v30;
  void *v31;
  std::__shared_weak_count *v32;

  v8 = a4;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v9, "appendData:", v8);
  +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 230, 0, 0, v9);
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v28, 0x2037uLL);
  v28 = &unk_24E0BF828;
  -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self, "transceiveAndRecordCapdu:rapdu:", &v31, &v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *v29;
  v14 = v29[1];
  v16 = v14 - *v29;
  if (v13)
  {
    if (v16 >= 2)
    {
      v17 = *(unsigned __int8 *)(v14 - 1);
      v18 = *(unsigned __int8 *)(v16 + v15 - 2);
LABEL_8:
      v19 = v17 | (v18 << 8);
      goto LABEL_9;
    }
LABEL_5:
    v19 = 43947;
LABEL_9:
    _ObjCLogWrapOutError(a5, v13, 0, "-[SETransceiveHelper crsSetSharingResult:signature:error:]", CFSTR("Bad SW 0x%x received in get sharing request\n"), v10, v11, v12, v19);
    v20 = 0;
    goto LABEL_10;
  }
  if (v16 < 2)
    goto LABEL_5;
  v18 = *(unsigned __int8 *)(v16 + v15 - 2);
  v17 = *(unsigned __int8 *)(v14 - 1);
  if ((v17 | (v18 << 8)) != 0x9000)
    goto LABEL_8;
  v20 = 1;
LABEL_10:

  v28 = &unk_24E0BF880;
  v21 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v31 = &unk_24E0BF880;
  v24 = v32;
  if (v32)
  {
    v25 = (unint64_t *)&v32->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  return v20;
}

- (id)transceiveAndRecordCapdu:(void *)a3 rapdu:(void *)a4
{
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  _QWORD v28[2];
  std::__shared_weak_count *v29;
  _QWORD v30[2];
  std::__shared_weak_count *v31;

  v8 = *((_QWORD *)a3 + 1);
  v7 = (std::__shared_weak_count *)*((_QWORD *)a3 + 2);
  v30[0] = &unk_24E0BF880;
  v30[1] = v8;
  v31 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  -[SETransceiveHelper recordApdu:toRecord:](self, "recordApdu:toRecord:", v30, self->_capduRecord);
  v30[0] = &unk_24E0BF880;
  v11 = v31;
  if (v31)
  {
    v12 = (unint64_t *)&v31->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", **((_QWORD **)a3 + 1), *(_QWORD *)(*((_QWORD *)a3 + 1) + 8) - **((_QWORD **)a3 + 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "asHexString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _ObjCLog((SEUpdaterUtil::SELogObj *)3, "-[SETransceiveHelper transceiveAndRecordCapdu:rapdu:]", CFSTR("SE <<<< %@\n"), v15);

  v16 = SEUpdater::P73BaseSEController::transceive((uint64_t)self->_fSeController.__ptr_, (uint64_t)a3, (uint64_t **)a4, 0, (SEUpdaterUtil::SELogObj *)3, 1);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", **((_QWORD **)a4 + 1), *(_QWORD *)(*((_QWORD *)a4 + 1) + 8) - **((_QWORD **)a4 + 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "asHexString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _ObjCLog((SEUpdaterUtil::SELogObj *)3, "-[SETransceiveHelper transceiveAndRecordCapdu:rapdu:]", CFSTR("SE >>>> %@\n"), v18);

  v20 = *((_QWORD *)a4 + 1);
  v19 = (std::__shared_weak_count *)*((_QWORD *)a4 + 2);
  v28[0] = &unk_24E0BF880;
  v28[1] = v20;
  v29 = v19;
  if (v19)
  {
    v21 = (unint64_t *)&v19->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  -[SETransceiveHelper recordApdu:toRecord:](self, "recordApdu:toRecord:", v28, self->_rapduRecord);
  v28[0] = &unk_24E0BF880;
  v23 = v29;
  if (v29)
  {
    v24 = (unint64_t *)&v29->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
      if ((_DWORD)v16)
        goto LABEL_17;
LABEL_19:
      v26 = 0;
      return v26;
    }
  }
  if (!(_DWORD)v16)
    goto LABEL_19;
LABEL_17:
  _ObjCLogNSError(0, 0, "-[SETransceiveHelper transceiveAndRecordCapdu:rapdu:]", CFSTR("Bad transceive with return code %d\n"), v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  return v26;
}

- (void)recordApdu:(Apdu *)a3 toRecord:(id)a4
{
  _QWORD *var0;
  void *v6;
  id v7;

  v7 = a4;
  var0 = a3->var1.var0;
  if (var0)
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *var0, var0[1] - *var0);
  else
    objc_msgSend(CFSTR("No APDU"), "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (BOOL)getSEPK:(id *)a3 andSEID:(id *)a4 deleteExisting:(BOOL)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  P73BaseSEController *ptr;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v22;
  __CFString *v23;
  BOOL v24;
  P73BaseSEController *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t DataSize;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  std::__shared_weak_count *v41;
  uint64_t *v42;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  __int16 v45;
  BOOL v46;
  char v47;

  if (!a3 || !a4)
  {
    _ObjCLogOutError((uint64_t *)a6, 14, "-[SETransceiveHelper getSEPK:andSEID:deleteExisting:error:]", CFSTR("Missing mandatory outparam"), a5, (uint64_t)a6, v6, v7, v39);
    return 0;
  }
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v42, 0x2037uLL);
  v42 = (uint64_t *)&unk_24E0BF828;
  ptr = self->_fSeController.__ptr_;
  SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)v40);
  v18 = SEUpdater::P73BaseSEController::transceive((uint64_t)ptr, (uint64_t)v40, &v42, 0, (SEUpdaterUtil::SELogObj *)2, 1);
  v40[0] = &unk_24E0BF880;
  v19 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v43[1];
  if ((_DWORD)v18)
  {
    v23 = CFSTR("Failed to select CRS %d 0x%hx\n");
LABEL_22:
    _ObjCLogOutError((uint64_t *)a6, 14, "-[SETransceiveHelper getSEPK:andSEID:deleteExisting:error:]", v23, v14, v15, v16, v17, v18);
    goto LABEL_23;
  }
  if ((unint64_t)(v22 - *v43) < 2)
  {
    v18 = 0;
    v23 = CFSTR("Failed to select CRS %d 0x%hx\n");
    goto LABEL_22;
  }
  if ((*(unsigned __int8 *)(v22 - 1) | (*(unsigned __int8 *)(v22 - 2) << 8)) != 0x9000)
  {
    v18 = 0;
    v23 = CFSTR("Failed to select CRS %d 0x%hx\n");
    goto LABEL_22;
  }
  v25 = self->_fSeController.__ptr_;
  v45 = -7040;
  v46 = a5;
  v47 = 0;
  SERestoreInfo::CApdu::CApdu(v40, &v45, 4uLL, 0);
  v40[0] = &off_24E0C18F0;
  v18 = SEUpdater::P73BaseSEController::transceive((uint64_t)v25, (uint64_t)v40, &v42, 0, (SEUpdaterUtil::SELogObj *)2, 1);
  v40[0] = &unk_24E0BF880;
  v26 = v41;
  if (v41)
  {
    v27 = (unint64_t *)&v41->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v43[1];
  if ((_DWORD)v18)
  {
    v23 = CFSTR("Failed to retrieve SEPK %d 0x%hx\n");
    goto LABEL_22;
  }
  if ((unint64_t)(v29 - *v43) < 2)
  {
    v18 = 0;
    v23 = CFSTR("Failed to retrieve SEPK %d 0x%hx\n");
    goto LABEL_22;
  }
  if ((*(unsigned __int8 *)(v29 - 1) | (*(unsigned __int8 *)(v29 - 2) << 8)) != 0x9000)
  {
    v18 = 0;
    v23 = CFSTR("Failed to retrieve SEPK %d 0x%hx\n");
    goto LABEL_22;
  }
  if (SERestoreInfo::RApdu::getDataSize((SERestoreInfo::RApdu *)&v42) == 89)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v43, 65);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v43 + 65, 24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 1;
    goto LABEL_24;
  }
  DataSize = SERestoreInfo::RApdu::getDataSize((SERestoreInfo::RApdu *)&v42);
  _ObjCLogOutError((uint64_t *)a6, 14, "-[SETransceiveHelper getSEPK:andSEID:deleteExisting:error:]", CFSTR("Wrong SEPK + SEID size %zu\n"), v35, v36, v37, v38, DataSize);
LABEL_23:
  v24 = 0;
LABEL_24:
  v42 = (uint64_t *)&unk_24E0BF880;
  v30 = v44;
  if (v44)
  {
    v31 = (unint64_t *)&v44->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  return v24;
}

- (BOOL)setAuthRandom:(id)a3 mac:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  P73BaseSEController *ptr;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD v35[2];
  std::__shared_weak_count *v36;
  uint64_t *v37;
  _QWORD *v38;
  std::__shared_weak_count *v39;

  v8 = a3;
  v9 = a4;
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v37, 0x2037uLL);
  v37 = (uint64_t *)&unk_24E0BF828;
  ptr = self->_fSeController.__ptr_;
  SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)v35);
  v15 = SEUpdater::P73BaseSEController::transceive((uint64_t)ptr, (uint64_t)v35, &v37, 0, (SEUpdaterUtil::SELogObj *)2, 1);
  v35[0] = &unk_24E0BF880;
  v16 = v36;
  if (v36)
  {
    p_shared_owners = (unint64_t *)&v36->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v38[1];
  if ((_DWORD)v15
    || (unint64_t)(v19 - *v38) < 2
    || (*(unsigned __int8 *)(v19 - 1) | (*(unsigned __int8 *)(v19 - 2) << 8)) != 0x9000)
  {
    _ObjCLogOutError((uint64_t *)a5, 14, "-[SETransceiveHelper setAuthRandom:mac:error:]", CFSTR("Failed to select CRS %d 0x%hx\n"), v11, v12, v13, v14, v15);
    v27 = 0;
  }
  else
  {
    v20 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v20, "appendData:", v9);
    +[APDUUtil getCXXApduWithCla:ins:p1:p2:payload:](APDUUtil, "getCXXApduWithCla:ins:p1:p2:payload:", 128, 226, 176, 0, v20);
    v21 = SEUpdater::P73BaseSEController::transceive((uint64_t)self->_fSeController.__ptr_, (uint64_t)v35, &v37, 0, (SEUpdaterUtil::SELogObj *)2, 1);
    v26 = v38[1];
    if ((_DWORD)v21
      || (unint64_t)(v26 - *v38) < 2
      || (*(unsigned __int8 *)(v26 - 1) | (*(unsigned __int8 *)(v26 - 2) << 8)) != 0x9000)
    {
      _ObjCLogOutError((uint64_t *)a5, 14, "-[SETransceiveHelper setAuthRandom:mac:error:]", CFSTR("Failed to set AR %d 0x%hx\n"), v22, v23, v24, v25, v21);
      v27 = 0;
    }
    else
    {
      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[SETransceiveHelper setAuthRandom:mac:error:]", CFSTR("Successfully set AR\n"));
      v27 = 1;
    }
    v35[0] = &unk_24E0BF880;
    v32 = v36;
    if (v36)
    {
      v33 = (unint64_t *)&v36->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }

  }
  v37 = (uint64_t *)&unk_24E0BF880;
  v28 = v39;
  if (v39)
  {
    v29 = (unint64_t *)&v39->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }

  return v27;
}

- (shared_ptr<SEUpdater::P73BaseSEController>)fSeController
{
  P73BaseSEController **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<SEUpdater::P73BaseSEController> result;

  cntrl = self->_fSeController.__cntrl_;
  *v2 = self->_fSeController.__ptr_;
  v2[1] = (P73BaseSEController *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (P73BaseSEController *)self;
  return result;
}

- (void)setFSeController:(shared_ptr<SEUpdater::P73BaseSEController>)a3
{
  std::shared_ptr<SEUpdater::P73BaseSEController>::operator=[abi:ne180100](&self->_fSeController.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (NSMutableArray)capduRecord
{
  return self->_capduRecord;
}

- (void)setCapduRecord:(id)a3
{
  objc_storeStrong((id *)&self->_capduRecord, a3);
}

- (NSMutableArray)rapduRecord
{
  return self->_rapduRecord;
}

- (void)setRapduRecord:(id)a3
{
  objc_storeStrong((id *)&self->_rapduRecord, a3);
}

- (void).cxx_destruct
{
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&self->_fSeController);
  objc_storeStrong((id *)&self->_rapduRecord, 0);
  objc_storeStrong((id *)&self->_capduRecord, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
