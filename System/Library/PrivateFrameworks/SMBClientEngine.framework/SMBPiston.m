@implementation SMBPiston

- (SMBPiston)init
{
  SMBPiston *v2;
  SMBPiston *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *shareList;
  objc_super v7;
  timespec v8;

  v8.tv_sec = 0;
  v8.tv_nsec = 0;
  v7.receiver = self;
  v7.super_class = (Class)SMBPiston;
  v2 = -[SMBPiston init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    if (pthread_mutex_init(&v2->state_mutex, 0))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_20;
    }
    else
    {
      v3->free_state_mutex = 1;
      if (pthread_mutex_init(&v3->session.session_credits_lock, 0))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_20;
      }
      else
      {
        v3->free_credit_mutex = 1;
        if (pthread_cond_init(&v3->session.session_credits_wait_cond, 0))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[SMBPiston init].cold.4();
          goto LABEL_21;
        }
        v3->free_credit_cond = 1;
        if (!pthread_mutex_init(&v3->session.session_lock, 0))
        {
          v3->free_session_mutex = 1;
          v3->session.option_flags = 251662338;
          *(_OWORD *)&v3->session.gss_context = 0u;
          v3->session.gss_in_token = 0u;
          v3->session.gss_out_token = 0u;
          v3->session.smb3_encrypt_ciper = 1;
          v3->session.smb3_signing_algorithm = 1;
          v8 = (timespec)xmmword_2302C5230;
          if (gethostuuid(v3->session.client_guid, &v8))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[SMBPiston init].cold.2();
            *(_DWORD *)v3->session.client_guid = random();
            *(_DWORD *)&v3->session.client_guid[4] = random();
            *(_DWORD *)&v3->session.client_guid[8] = random();
            *(_DWORD *)&v3->session.client_guid[12] = random();
          }
          v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          shareList = v3->_shareList;
          v3->_shareList = v4;

          if (!pthread_mutex_init(&v3->share_list_mutex, 0))
          {
            v3->free_share_list_mutex = 1;
            return v3;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          goto LABEL_20;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_20:
          -[SMBPiston init].cold.1();
      }
    }
LABEL_21:

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SMBPiston disconnect](self, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)SMBPiston;
  -[SMBPiston dealloc](&v3, sel_dealloc);
}

- (void)negotiateTo:(id)a3 netBIOSname:(id)a4 withVPNCookie:(id)a5 outParameters:(smb_negotiate *)a6 callBack:(id)a7
{
  piston_negotiate(self, a3, a4, 445, 30, (uint64_t)a6, a7);
}

- (void)negotiateTo:(id)a3 netBIOSname:(id)a4 outParameters:(smb_negotiate *)a5 callBack:(id)a6
{
  piston_negotiate(self, a3, a4, 445, 30, (uint64_t)a5, a6);
}

- (void)negotiateTo:(id)a3 netBIOSname:(id)a4 port:(unsigned __int16)a5 outParameters:(smb_negotiate *)a6 callBack:(id)a7
{
  piston_negotiate(self, a3, a4, a5, 30, (uint64_t)a6, a7);
}

- (void)negotiateTo:(id)a3 netBIOSname:(id)a4 port:(unsigned __int16)a5 withTimeOut:(unsigned int)a6 outParameters:(smb_negotiate *)a7 callBack:(id)a8
{
  piston_negotiate(self, a3, a4, a5, *(uint64_t *)&a6, (uint64_t)a7, a8);
}

- (void)disconnect
{
  SMBSocket **p_sock;
  id WeakRetained;
  id v5;
  char *session_model_infop;

  p_sock = &self->_sock;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sock);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_sock);
    objc_msgSend(v5, "closeSocket");

    objc_storeWeak((id *)p_sock, 0);
  }
  -[SMBPiston share_list_lock](self, "share_list_lock");
  if (-[NSMutableDictionary count](self->_shareList, "count"))
    -[NSMutableDictionary removeAllObjects](self->_shareList, "removeAllObjects");
  -[SMBPiston share_list_unlock](self, "share_list_unlock");
  session_model_infop = self->session.session_model_infop;
  if (session_model_infop)
    free(session_model_infop);
  self->session.session_model_infop = 0;
  piston_gss_reset((gss_cred_id_t *)&self->session);
  smb_reset_sig((uint64_t)&self->session);
  if (self->free_state_mutex)
  {
    pthread_mutex_destroy(&self->state_mutex);
    self->free_state_mutex = 0;
  }
  if (self->free_credit_mutex)
  {
    pthread_mutex_destroy(&self->session.session_credits_lock);
    self->free_credit_mutex = 0;
  }
  if (self->free_credit_cond)
  {
    pthread_cond_destroy(&self->session.session_credits_wait_cond);
    self->free_credit_cond = 0;
  }
  if (self->free_session_mutex)
  {
    pthread_mutex_destroy(&self->session.session_lock);
    self->free_session_mutex = 0;
  }
  if (self->free_share_list_mutex)
  {
    pthread_mutex_destroy(&self->share_list_mutex);
    self->free_share_list_mutex = 0;
  }
}

- (void)login:(smb_login_out *)a3 asUser:(id)a4 withPassword:(id)a5 inRealm:(id)a6 callBack:(id)a7
{
  piston_session_setup(self, a4, a5, a6, (uint64_t)a3, a7);
}

- (void)logoff
{
  piston_logoff(self, 0, 0);
}

- (void)logoff:(smb_login_out *)a3 callBack:(id)a4
{
  SMBSocket **p_sock;
  id WeakRetained;
  id v7;

  piston_logoff(self, (uint64_t)a3, a4);
  p_sock = &self->_sock;
  WeakRetained = objc_loadWeakRetained((id *)p_sock);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_sock);
    objc_msgSend(v7, "closeSocket");

    objc_storeWeak((id *)p_sock, 0);
  }
}

- (void)treeConnect:(smb_tree_connect_disc *)a3 toShare:(id)a4 callBack:(id)a5
{
  piston_tree_connect(self, a4, (uint64_t)a3, a5);
}

- (void)treeDisconnect:(smb_tree_connect_disc *)a3 fromShareID:(unsigned int)a4 callBack:(id)a5
{
  piston_tree_disconnect(self, *(uint64_t *)&a4, (uint64_t)a3, a5);
}

- (void)queryShareInformation:(smb_query_share *)a3 forShareID:(unsigned int)a4 forModelInfo:(id)a5 forFileSystemName:(id)a6 callBack:(id)a7
{
  piston_query_share_info(self, a4, (uint64_t)a3, a5, a6, a7);
}

- (void)leaseBreakAcknowledge:(smb_lease_break_ack *)a3 callBack:(id)a4
{
  piston_lease_break_ack(self, &a3->var0, a4);
}

- (void)ioctl:(smb_ioctl *)a3 onShareID:(unsigned int)a4 getDFSRefFor:(id)a5 withRecvData:(id)a6 callBack:(id)a7
{
  piston_ioctl(self, 0, *(uint64_t *)&a4, (uint64_t)a3, 0, a6, a5, 0, 0, a7);
}

- (void)ioctl:(smb_ioctl *)a3 onShareID:(unsigned int)a4 pipeWaitOnName:(id)a5 withTimeOut:(int64_t)a6 callBack:(id)a7
{
  piston_ioctl(self, 0, *(uint64_t *)&a4, (uint64_t)a3, 0, 0, 0, a5, a6, a7);
}

- (void)validateNegotiate:(smb_ioctl *)a3 callBack:(id)a4
{
  piston_validate_negotiate(self, (uint64_t)a3, 0, a4);
}

- (void)validateNegotiate:(smb_ioctl *)a3 onShareID:(unsigned int)a4 callBack:(id)a5
{
  piston_validate_negotiate(self, (uint64_t)a3, *(uint64_t *)&a4, a5);
}

- (void)serverCopyFile:(smb_server_copy_file *)a3 onShareID:(unsigned int)a4 from:(id)a5 to:(id)a6 withOptions:(unint64_t)a7 callBack:(id)a8
{
  piston_server_copy_file(self, *(uint64_t *)&a4, a5, a6, a7, (uint64_t)a3, a8);
}

- (void)resolveID:(smb_create *)a3 forShareID:(unsigned int)a4 returnPath:(id)a5 callBack:(id)a6
{
  piston_resolveID(self, a4, (uint64_t)a3, a5, a6);
}

- (unsigned)getCreateOptions:(id)a3 parentName:(id)a4 streamName:(id)a5 vnodeType:(int)a6 fileAttributes:(unsigned int)a7 checkForReparsePoint:(unsigned int)a8
{
  return piston_get_create_options(self, 0, a3, a4, a5, a6, a7, a8);
}

- (unsigned)getCreateOptions:(id)a3 onShareID:(unsigned int)a4 parentName:(id)a5 streamName:(id)a6 vnodeType:(int)a7 fileAttributes:(unsigned int)a8 checkForReparsePoint:(unsigned int)a9
{
  return piston_get_create_options(self, *(uint64_t *)&a4, a3, a5, a6, a7, a8, a9);
}

- (int)getPeerAddress:(sockaddr_storage *)a3 withLength:(unsigned int *)a4
{
  size_t v5;
  void *v8;
  void *v9;
  unsigned __int8 *v10;
  size_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v53;

  if (!a3 || !a4)
  {
    v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v20)
      -[SMBPiston getPeerAddress:withLength:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    return 22;
  }
  v5 = *a4;
  if (!(_DWORD)v5)
  {
    v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v28)
      -[SMBPiston getPeerAddress:withLength:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);
    return 22;
  }
  bzero(a3, v5);
  -[SMBPiston sock](self, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      -[SMBPiston getPeerAddress:withLength:].cold.3(v36, v37, v38, v39, v40, v41, v42, v43);
    return 22;
  }
  -[SMBPiston sock](self, "sock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unsigned __int8 *)objc_msgSend(v9, "getServerAddress");

  if (!v10)
  {
    v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v44)
      -[SMBPiston getPeerAddress:withLength:].cold.4(v44, v45, v46, v47, v48, v49, v50, v51);
    return 22;
  }
  v11 = *v10;
  if (*a4 >= v11)
  {
    *a4 = v11;
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      -[SMBPiston getPeerAddress:withLength:].cold.5(v12, v13, v14, v15, v16, v17, v18, v19);
    v11 = *a4;
  }
  memcpy(a3, v10, v11);
  if (*a4 >= 5)
  {
    -[SMBPiston sock](self, "sock");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)a3->__ss_pad1 = objc_msgSend(v53, "port");

  }
  return 0;
}

- (smb_session)getSessionPtr
{
  return &self->session;
}

- (id)getShare:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMBPiston share_list_lock](self, "share_list_lock");
  -[NSMutableDictionary objectForKey:](self->_shareList, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    if (-[NSMutableDictionary count](self->_shareList, "count") == 1)
    {
      -[NSMutableDictionary keyEnumerator](self->_shareList, "keyEnumerator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      while (1)
      {
        v9 = v7;
        objc_msgSend(v8, "nextObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          break;
        -[NSMutableDictionary objectForKey:](self->_shareList, "objectForKey:", v7);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v6 = (void *)v10;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[SMBPiston getShare:].cold.2(v6);
          goto LABEL_13;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBPiston getShare:].cold.1();
    v7 = 0;
    v6 = 0;
  }
LABEL_13:
  -[SMBPiston share_list_unlock](self, "share_list_unlock");

  return v6;
}

- (void)setEventHandler:(id)a3
{
  SMBSocket **p_sock;
  id v4;
  id WeakRetained;

  p_sock = &self->_sock;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sock);
  objc_msgSend(WeakRetained, "setEventHandler:", v4);

}

- (void)setOption:(const char *)a3 toValue:(unsigned int)a4
{
  const char *v7;
  unint64_t v8;

  switch(strnlen(a3, 0xFFuLL))
  {
    case 7uLL:
      v7 = "minauth";
      goto LABEL_8;
    case 9uLL:
      if (strcmp(a3, "ntlm_only"))
        return;
      v8 = self->session.option_flags | 0x100000;
      goto LABEL_19;
    case 0xBuLL:
      if (!strcmp(a3, "debug_level"))
        piston_log_level = a4;
      return;
    case 0xDuLL:
      v7 = "kerberos_only";
LABEL_8:
      if (strcmp(a3, v7))
        return;
      v8 = self->session.option_flags | 0x200000;
      goto LABEL_19;
    case 0x10uLL:
      if (!strcmp(a3, "signing_required"))
      {
        v8 = self->session.option_flags | 0x100;
      }
      else
      {
        if (strcmp(a3, "validate_neg_off"))
          return;
        v8 = self->session.option_flags | 8;
      }
LABEL_19:
      self->session.option_flags = v8;
      return;
    case 0x11uLL:
      if (strcmp(a3, "protocol_vers_map"))
        return;
      if ((a4 & 2) != 0)
        self->session.option_flags |= 2uLL;
      if ((a4 & 0x1000) == 0)
        return;
      v8 = self->session.option_flags | 0x1000;
      goto LABEL_19;
    default:
      return;
  }
}

- (void)share_list_lock
{
  pthread_mutex_lock(&self->share_list_mutex);
}

- (void)share_list_unlock
{
  pthread_mutex_unlock(&self->share_list_mutex);
}

- (NSMutableDictionary)shareList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 920, 1);
}

- (void)setShareList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 920);
}

- (SMBSocket)sock
{
  return (SMBSocket *)objc_loadWeakRetained((id *)&self->_sock);
}

- (void)setSock:(id)a3
{
  objc_storeWeak((id *)&self->_sock, a3);
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 936, 1);
}

- (void)setUserName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 936);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 944, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 944);
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 952, 1);
}

- (void)setRealm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 952);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_destroyWeak((id *)&self->_sock);
  objc_storeStrong((id *)&self->_shareList, 0);
}

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: pthread_cond_init failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPeerAddress:(uint64_t)a3 withLength:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: addressp or address_lenp is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPeerAddress:(uint64_t)a3 withLength:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: *address_lenp is 0 \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPeerAddress:(uint64_t)a3 withLength:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: socket is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPeerAddress:(uint64_t)a3 withLength:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: server_addrp is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPeerAddress:(uint64_t)a3 withLength:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: address buffer too small, truncating \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getShare:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getShare:(void *)a1 .cold.2(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "sharename");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "cStringUsingEncoding:", 4);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: Share id <%d> not found, assuming you wanted <%s> instead \n", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_6_0();
}

@end
