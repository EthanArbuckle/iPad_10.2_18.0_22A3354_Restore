@implementation NSPServerODoH

- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  id inited;
  uint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  NSPServerODoH *v40;
  id v41;
  int v42;
  id buf;
  __int16 v44;
  const char *v45;
  __int16 v46;
  void *v47;
  __int128 buffer;
  _OWORD v49[3];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  buffer = 0u;
  memset(v49, 0, sizeof(v49));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NWNetworkAgentStartOptionClientUUID));
  v13 = v10;
  if (!v10)
  {
    v14 = 0;
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](NWPath, "pathForClientID:", v10));
  v14 = v10;
  if (!v10)
  {
LABEL_7:
    v22 = 0;
    v15 = 0;
    goto LABEL_13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interface"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parameters"));
  v17 = objc_msgSend(v16, "pid");
  if (!v17)
  {
LABEL_11:
    v22 = 0;
    goto LABEL_12;
  }
  v18 = v17;
  v19 = proc_pidinfo(v17, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v19 != 64)
  {
    v23 = nplog_obj(v19, v20, v21);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&buf, 8u);
    }

    goto LABEL_11;
  }
  v22 = (const char *)v49;
LABEL_12:

LABEL_13:
  v25 = nplog_obj(v10, v11, v12);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (v22)
      v27 = v22;
    else
      v27 = "none";
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "interfaceName"));
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v6;
    v44 = 2080;
    v45 = v27;
    v46 = 2112;
    v47 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received DNS error (%d) from %s on interface %@", (uint8_t *)&buf, 0x1Cu);

  }
  inited = objc_initWeak(&buf, self);
  v30 = NPGetInternalQueue(inited);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v35 = _NSConcreteStackBlock;
  v36 = 3221225472;
  v37 = sub_10004E4B8;
  v38 = &unk_1000F5EE0;
  objc_copyWeak(&v41, &buf);
  v42 = v6;
  v32 = v15;
  v39 = v32;
  v40 = self;
  dispatch_async(v31, &v35);

  if ((_DWORD)v6)
  {
    if (self)
      self = (NSPServerODoH *)objc_loadWeakRetained((id *)&self->_delegate);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolver", v35, v36, v37, v38));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dohURL"));
    -[NSPServerODoH handleDNSAgentErrorReport:error:](self, "handleDNSAgentErrorReport:error:", v34, v6);

  }
  objc_destroyWeak(&v41);
  objc_destroyWeak(&buf);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleStats, 0);
  objc_storeStrong((id *)&self->_lastOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_lastResolverSwitchedDate, 0);
  objc_storeStrong((id *)&self->_candidateResolverRestoreTimer, 0);
  objc_storeStrong((id *)&self->_candidateResolvers, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
  objc_storeStrong((id *)&self->_lastPrimaryInterfaceChangedDate, 0);
  objc_storeStrong((id *)&self->_lastPathUnsatisfiedDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bootstrapDNSAgentRegistration, 0);
  objc_storeStrong((id *)&self->_bootstrapDNSAgent, 0);
  objc_storeStrong((id *)&self->_privacyProxyDNSAgentRegistration, 0);
  objc_storeStrong((id *)&self->_privacyProxyDNSAgent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overridePreferredResolver, 0);
}

@end
