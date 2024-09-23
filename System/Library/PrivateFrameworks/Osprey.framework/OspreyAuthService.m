@implementation OspreyAuthService

- (OspreyAuthService)initWithChannel:(id)a3 authStrategyVersion:(unint64_t)a4
{
  id v7;
  OspreyAuthService *v8;
  OspreyAuthService *v9;
  uint64_t v10;
  NSUUID *authUUID;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OspreyAuthService;
  v8 = -[OspreyAuthService init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channel, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    authUUID = v9->_authUUID;
    v9->_authUUID = (NSUUID *)v10;

    v9->_authStrategyVersion = a4;
  }

  return v9;
}

- (void)certificateDataWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  uint64_t BufferPointer;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  OspreyGRPCChannel *channel;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  OspreyLoggingInit();
  v8 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
    -[OspreyAuthService certificateDataWithSuccess:failure:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  v29 = 0;
  v30 = 0;
  v31 = xmmword_1B981BDD0;
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  v35 = 1;
  v36 = 256;
  v37 = 0;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)&v29);
  BYTE6(v34) = 1;
  v16 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)&v29, (int)v32 - (int)v33 + DWORD2(v32));
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v29, v16, 0, 0);
  v17 = objc_alloc(MEMORY[0x1E0C99D50]);
  BufferPointer = flatbuffers::FlatBufferBuilder::GetBufferPointer((flatbuffers::FlatBufferBuilder *)&v29);
  v19 = (void *)objc_msgSend(v17, "initWithBytes:length:", BufferPointer, (v32 - v33 + DWORD2(v32)));
  +[OspreyRequest requestWithMethodName:](OspreyRequest, "requestWithMethodName:", CFSTR("/siri.sidecars.auth.AuthSession/GetCertificate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_authUUID, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClientTraceId:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_authStrategyVersion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDeviceAuthenticationVersion:", v22);

  channel = self->_channel;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke;
  v26[3] = &unk_1E70982D0;
  v24 = v7;
  v27 = v24;
  v25 = v6;
  v28 = v25;
  -[OspreyGRPCChannel unaryRequest:requestData:responseHandler:](channel, "unaryRequest:requestData:responseHandler:", v20, v19, v26);

  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v29);
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD v28[6];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    OspreyLoggingInit();
    v7 = (id)OspreyLogContextAbsinthe;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_3(v8, v28);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(v5, "length"))
  {
    OspreyLoggingInit();
    v9 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
      __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_2(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v18 = (unsigned int *)((char *)v17
                         + *v17
                         + *(unsigned __int16 *)((char *)v17 + *v17 - *(unsigned int *)((char *)v17 + *v17) + 4));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)v18 + *v18 + 4, *(unsigned int *)((char *)v18 + *v18));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    OspreyLoggingInit();
    v20 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)createClientSessionWithData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const void *v20;
  size_t v21;
  const void *v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  void *v28;
  uint64_t BufferPointer;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  OspreyGRPCChannel *channel;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  uint64_t v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  OspreyLoggingInit();
  v11 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
    -[OspreyAuthService createClientSessionWithData:success:failure:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  v19 = objc_retainAutorelease(v8);
  v20 = (const void *)objc_msgSend(v19, "bytes");
  v21 = objc_msgSend(v19, "length");
  v49 = 0;
  v50 = 0;
  v51 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v49, v20, (uint64_t)v20 + v21, v21);
  v40 = 0;
  v41 = 0;
  v42 = xmmword_1B981BDD0;
  v43 = 0u;
  v44 = 0u;
  v45 = 0;
  v46 = 1;
  v47 = 256;
  if (v50 == v49)
    v22 = &flatbuffers::data<unsigned char,std::allocator<unsigned char>>(std::vector<unsigned char> const&)::t;
  else
    v22 = v49;
  v48 = 0;
  v23 = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>((flatbuffers::FlatBufferBuilder *)&v40, v22, v50 - v49);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)&v40);
  BYTE6(v45) = 1;
  v24 = DWORD2(v43);
  v25 = v44;
  v26 = v43;
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)&v40, 4, v23);
  v27 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)&v40, v26 - v25 + v24);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v40, v27, 0, 0);
  v28 = (void *)MEMORY[0x1E0C99D50];
  BufferPointer = flatbuffers::FlatBufferBuilder::GetBufferPointer((flatbuffers::FlatBufferBuilder *)&v40);
  objc_msgSend(v28, "dataWithBytes:length:", BufferPointer, (v43 - v44 + DWORD2(v43)));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[OspreyRequest requestWithMethodName:](OspreyRequest, "requestWithMethodName:", CFSTR("/siri.sidecars.auth.AuthSession/CreateSession"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_authUUID, "UUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClientTraceId:", v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_authStrategyVersion);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDeviceAuthenticationVersion:", v33);

  channel = self->_channel;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke;
  v37[3] = &unk_1E70982D0;
  v35 = v10;
  v38 = v35;
  v36 = v9;
  v39 = v36;
  -[OspreyGRPCChannel unaryRequest:requestData:responseHandler:](channel, "unaryRequest:requestData:responseHandler:", v31, v30, v37);

  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v40);
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }

}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _DWORD v39[6];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    OspreyLoggingInit();
    v7 = (id)OspreyLogContextAbsinthe;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_4(v8, v39);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
  if (!v5 || !objc_msgSend(v5, "length"))
  {
    OspreyLoggingInit();
    v26 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_20;
  }
  v9 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  v10 = (unsigned int *)((char *)v9 + *v9);
  v11 = (unsigned __int16 *)((char *)v10 - (int)*v10);
  if (*v11 < 5u || (v12 = v11[2]) == 0)
  {
    v13 = 0;
LABEL_18:
    OspreyLoggingInit();
    v34 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_2(v13, v34);
LABEL_20:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
  v13 = *(unsigned int *)((char *)v10 + v12);
  if (v13 != 1)
    goto LABEL_18;
  OspreyLoggingInit();
  v14 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
    __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
  v22 = (unsigned __int16 *)((char *)v10 - (int)*v10);
  v23 = v22[3];
  if (v22[3])
  {
    v24 = *(unsigned int *)((char *)v10 + v23);
    v25 = (char *)v10 + v23 + v24;
  }
  else
  {
    v23 = 0;
    v25 = 0;
    v24 = *v10;
  }
  v35 = 0.0;
  if (*v22 >= 9u)
  {
    v36 = v22[4];
    if (v36)
      v35 = (double)*(unint64_t *)((char *)v10 + v36);
  }
  v37 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v25 + 4, *(unsigned int *)((char *)v10 + v23 + v24));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, double))(v37 + 16))(v37, v38, v35);

LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authUUID, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)certificateDataWithSuccess:(uint64_t)a3 failure:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Fetching cert from server...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Certificate data was empty!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Successfully fetched certificate!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_3(void *a1, _DWORD *a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  *a2 = 136315394;
  OUTLINED_FUNCTION_4_0((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[OspreyAuthService certificateDataWithSuccess:failure:]_block_invoke");
  OUTLINED_FUNCTION_3_4(&dword_1B97C2000, v3, v4, "%s Error fetching cert from auth service! Error: %@", v5);

}

- (void)createClientSessionWithData:(uint64_t)a3 success:(uint64_t)a4 failure:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Creating client session...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Could not get signed session info from auth service!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[OspreyAuthService createClientSessionWithData:success:failure:]_block_invoke";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1B97C2000, a2, OS_LOG_TYPE_ERROR, "%s Auth server responded with non 1 code. Code: %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Successfully created client session!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_4(void *a1, _DWORD *a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  *a2 = 136315394;
  OUTLINED_FUNCTION_4_0((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[OspreyAuthService createClientSessionWithData:success:failure:]_block_invoke");
  OUTLINED_FUNCTION_3_4(&dword_1B97C2000, v3, v4, "%s Error getting session info response from auth service! Error: %@", v5);

}

@end
