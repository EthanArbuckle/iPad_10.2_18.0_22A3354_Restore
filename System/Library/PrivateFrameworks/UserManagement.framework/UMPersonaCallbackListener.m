@implementation UMPersonaCallbackListener

- (UMPersonaCallbackListener)init
{
  const char *v2;
  uint64_t v3;
  UMPersonaCallbackListener *v4;
  uint64_t v5;
  NSMutableSet *xpcConnections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UMPersonaCallbackListener;
  v4 = -[UMPersonaCallbackListener init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E20], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    xpcConnections = v4->_xpcConnections;
    v4->_xpcConnections = (NSMutableSet *)v5;

  }
  return v4;
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  sub_18FAEBD08();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18FB04600;
  v8[3] = &unk_1E2A4B358;
  v9 = v5;
  v7 = v5;
  sub_18FAEBEE8((uint64_t)v6, self, v8);

}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  sub_18FAEBD08();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18FB046E8;
  v8[3] = &unk_1E2A4B358;
  v9 = v5;
  v7 = v5;
  sub_18FAEBEE8((uint64_t)v6, self, v8);

}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  sub_18FAEBD08();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18FB047D0;
  v8[3] = &unk_1E2A4B358;
  v9 = v5;
  v7 = v5;
  sub_18FAEBEE8((uint64_t)v6, self, v8);

}

- (void)userSwitchTaskListDidUpdate
{
  id v3;

  sub_18FAEBD08();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEBEE8((uint64_t)v3, self, &unk_1E2A4B398);

}

- (void)deviceLoginSessionStateDidUpdate
{
  id v3;

  sub_18FAEBD08();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEBEE8((uint64_t)v3, self, &unk_1E2A4B3B8);

}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAEBD08();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FB049C8;
  v7[3] = &unk_1E2A4B358;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)bubbleDidPop
{
  id v3;

  sub_18FAEBD08();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEBEE8((uint64_t)v3, self, &unk_1E2A4B3D8);

}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAEBD08();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FB04B38;
  v7[3] = &unk_1E2A4B358;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sub_18FAEBD08();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FB04C20;
  v7[3] = &unk_1E2A4B400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  sub_18FAE9AB8();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v6, CFSTR("Should accept connection for UMPersonaCallbackListener"), v7, v8, v9, v10, v11, v12, v16);

  sub_18FAE8D1C();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18FB04E50;
  v17[3] = &unk_1E2A4B428;
  v18 = v5;
  v14 = v5;
  sub_18FAEBEE8((uint64_t)v13, self, v17);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personaUpdateCallbackHandler, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
