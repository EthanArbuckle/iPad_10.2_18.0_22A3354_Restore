@implementation NRDevicePairingCandidateContext

- (void)dealloc
{
  objc_super v3;

  sub_1000FE6A0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRDevicePairingCandidateContext;
  -[NRDevicePairingCandidateContext dealloc](&v3, "dealloc");
}

- (NSString)description
{
  if (self)
    self = (NRDevicePairingCandidateContext *)self->_candidateInfo;
  return -[NRDevicePairingCandidateContext description](self, "description");
}

- (BOOL)sendPacketData:(id)a3
{
  id v4;
  channel_ring_desc *pipeOutputRing;
  uint64_t next_slot;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  int IsLevelEnabled;
  id v13;
  id v15;
  int v16;
  id v17;
  id v18;
  int v19;
  const char *v20;
  id v21;
  int v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  id v27;
  int v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v4 = a3;
  if (!v4)
  {
    v11 = sub_1000FBA50();
    IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17);

    if (IsLevelEnabled)
    {
      v13 = sub_1000FBA50();
      _NRLogWithArgs(v13, 17, "%s called with null data", "-[NRDevicePairingCandidateContext sendPacketData:]");

    }
    goto LABEL_11;
  }
  if (self)
  {
    pipeOutputRing = self->_pipeOutputRing;
    if (pipeOutputRing)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      next_slot = os_channel_get_next_slot(pipeOutputRing, 0, &v31);
      if (next_slot)
      {
        v7 = next_slot;
        v8 = WORD1(v31);
        if ((unint64_t)objc_msgSend(v4, "length") <= v8)
        {
          objc_msgSend(v4, "getBytes:length:", (_QWORD)v32, WORD1(v31));
          WORD1(v31) = (unsigned __int16)objc_msgSend(v4, "length");
          os_channel_set_slot_properties(self->_pipeOutputRing, v7, &v31);
          v9 = os_channel_advance_slot(self->_pipeOutputRing, v7);
          if (v9)
          {
            v22 = v9;
            v23 = sub_1000FBA50();
            v24 = _NRLogIsLevelEnabled(v23, 17);

            if (v24)
            {
              v25 = sub_1000FBA50();
              _NRLogWithArgs(v25, 17, "os_channel_advance_slot failed: %d", v22);

            }
          }
          v10 = os_channel_sync(self->_pipeChannel, 0);
          if (!(_DWORD)v10)
            goto LABEL_8;
          v26 = (void *)v10;
          v27 = sub_1000FBA50();
          v28 = _NRLogIsLevelEnabled(v27, 17);

          if (!v28)
            goto LABEL_8;
          v21 = sub_1000FBA50();
          v17 = v21;
          v29 = v26;
          v20 = "os_channel_advance_slot failed: %d";
          goto LABEL_21;
        }
        v18 = sub_1000FBA50();
        v19 = _NRLogIsLevelEnabled(v18, 17);

        if (v19)
        {
          v17 = sub_1000FBA50();
          v29 = objc_msgSend(v4, "length");
          v30 = WORD1(v31);
          v20 = "IKE message too large for slot (%zu > %u)";
          v21 = v17;
LABEL_21:
          _NRLogWithArgs(v21, 17, v20, v29, v30);
          goto LABEL_22;
        }
      }
      else
      {
        v15 = sub_1000FBA50();
        v16 = _NRLogIsLevelEnabled(v15, 0);

        if (v16)
        {
          v17 = sub_1000FBA50();
          objc_msgSend(v4, "length");
          _NRLogWithArgs(v17, 0, "%s%.30s:%-4d Dropping IKE message of length %zu due to no slots");
LABEL_22:

        }
      }
LABEL_8:
      LOBYTE(self) = 1;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(self) = 0;
  }
LABEL_12:

  return (char)self;
}

- (void)setPacketReceiver:(id)a3
{
  id v4;
  NEIKEv2PacketReceiver *v5;
  void *ikePacketReceiver;
  id v7;
  int IsLevelEnabled;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    v7 = sub_1000FBA50();
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 17);

    v4 = 0;
    if (!IsLevelEnabled)
      goto LABEL_5;
    ikePacketReceiver = sub_1000FBA50();
    _NRLogWithArgs(ikePacketReceiver, 17, "%s called with null receiver", "-[NRDevicePairingCandidateContext setPacketReceiver:]");
    goto LABEL_4;
  }
  if (self)
  {
    v5 = (NEIKEv2PacketReceiver *)v4;
    ikePacketReceiver = self->_ikePacketReceiver;
    self->_ikePacketReceiver = v5;
LABEL_4:

    v4 = v9;
  }
LABEL_5:

}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int IsLevelEnabled;
  id v33;
  id v34;

  v34 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v33 = a7;
  v17 = a8;
  if (qword_1001E4820 != -1)
    dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
  if (_NRLogIsLevelEnabled(qword_1001E4818, 0))
  {
    if (qword_1001E4820 != -1)
      dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
    _NRLogWithArgs(qword_1001E4818, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@", ", "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1957, self, v34, v14, v15);
  }
  if (!v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localIdentifier"));
    v19 = v14;
    if (qword_1001E4970 != -1)
      dispatch_once(&qword_1001E4970, &stru_1001B7E28);
    v20 = (id)qword_1001E4968;
    v21 = objc_msgSend(v18, "isEqual:", v20);

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteIdentifier"));
      v23 = objc_msgSend(v22, "identifierType");

      if (v23 == (id)13)
      {
        v24 = objc_msgSend(objc_alloc((Class)NEIKEv2AuthenticationProtocol), "initWithMethod:", 13);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localIdentifier"));
        v26 = sub_10011268C(0, v25, v24);

        v27 = v33;
        if ((*((unsigned int (**)(id, id))v33 + 2))(v33, v26))
        {
          v28 = v19;
          if (self)
          {
            sub_1000FBC2C((uint64_t)NRDevicePairingCandidateContext, (id *)&self->_ikeSessionControl);
            objc_storeStrong((id *)&self->_ikeSessionControl, a4);
            sub_1000FBD84((uint64_t)self);
          }
        }
        else
        {
          v28 = v26;
          v26 = 0;
        }

        v14 = v19;
        v16 = 0;
        goto LABEL_30;
      }
      if (qword_1001E4820 != -1)
        dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
      v14 = v19;
      v16 = 0;
      if (_NRLogIsLevelEnabled(qword_1001E4818, 16))
      {
        if (qword_1001E4820 != -1)
          dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
        v30 = (id)qword_1001E4818;
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteIdentifier"));
        _NRLogWithArgs(v30, 16, "%s%.30s:%-4d Unrecognized remote identifier %@", ", "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1968, v24);

        goto LABEL_27;
      }
    }
    else
    {
      v14 = v19;
      if (qword_1001E4820 != -1)
        dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
      v16 = 0;
      if (_NRLogIsLevelEnabled(qword_1001E4818, 16))
      {
        if (qword_1001E4820 != -1)
          dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
        v29 = (id)qword_1001E4818;
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localIdentifier"));
        _NRLogWithArgs(v29, 16, "%s%.30s:%-4d Unrecognized local identifier %@", ", "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1982, v24);

        goto LABEL_27;
      }
    }
LABEL_33:
    v26 = 0;
    v27 = v33;
    goto LABEL_34;
  }
  v31 = sub_1000FBA50();
  IsLevelEnabled = _NRLogIsLevelEnabled(v31, 16);

  if (!IsLevelEnabled)
    goto LABEL_33;
  v24 = sub_1000FBA50();
  _NRLogWithArgs(v24, 16, "%s%.30s:%-4d Unexpectedly received child config %@", ", "-[NRDevicePairingCandidateContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1962, v16);
LABEL_27:
  v26 = 0;
  v27 = v33;
LABEL_30:

LABEL_34:
  (*((void (**)(id, id, _QWORD, _QWORD))v17 + 2))(v17, v26, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbkdf2Group, 0);
  objc_storeStrong((id *)&self->_derivedPSKForPairing, 0);
  objc_storeStrong((id *)&self->_pinSalt, 0);
  objc_storeStrong((id *)&self->_ikePacketReceiver, 0);
  objc_storeStrong((id *)&self->_ikeSessionPairing, 0);
  objc_storeStrong((id *)&self->_ikeSessionControl, 0);
  objc_storeStrong((id *)&self->_ikeListener, 0);
  objc_storeStrong((id *)&self->_pipeInputSource, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_deviceEndpoint, 0);
  objc_storeStrong((id *)&self->_cbDevice, 0);
  objc_storeStrong((id *)&self->_pairingTarget, 0);
  objc_storeStrong((id *)&self->_candidateInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_pairingManager);
}

@end
