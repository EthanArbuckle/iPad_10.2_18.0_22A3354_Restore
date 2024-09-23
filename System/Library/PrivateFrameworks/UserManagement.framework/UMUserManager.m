@implementation UMUserManager

- (BOOL)isLoginSession
{
  return sub_18FAE9FB8();
}

- (UMUserPersona)currentPersona
{
  return sub_18FAE9B44();
}

- (UMUserManager)init
{
  UMUserManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UMUserManager;
  result = -[UMUserManager init](&v3, sel_init);
  if (result)
    result->_switchIsOccurring = 0;
  return result;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAE80C8;
  block[3] = &unk_1E2A4A848;
  block[4] = a1;
  if (qword_1ECD37F78 != -1)
    dispatch_once(&qword_1ECD37F78, block);
  return (id)qword_1ECD37F70;
}

- (unint64_t)personaGenerationIdentifierWithError:(id *)a3
{
  void *v4;
  unint64_t v5;

  sub_18FAEA8CC();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sub_18FAEA3C8((uint64_t)v4, a3);

  return v5;
}

- (BOOL)isSharedIPad
{
  return sub_18FAE9DE8();
}

- (BOOL)isMultiUser
{
  return sub_18FAE9DE8();
}

- (UMUser)currentUser
{
  return (UMUser *)sub_18FAE7B78();
}

- (unint64_t)maxNumberOfUsers
{
  return sub_18FAED9A0();
}

- (unint64_t)userQuotaSize
{
  return sub_18FAEDA88();
}

- (BOOL)canAccessUserProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAF33CC;
  block[3] = &unk_1E2A4AB50;
  block[4] = self;
  if (qword_1EE185018 != -1)
    dispatch_once(&qword_1EE185018, block);
  return (byte_1EE185010 & 1) == 0;
}

- (UMUser)loginUser
{
  return (UMUser *)sub_18FAEDC1C();
}

- (void)userListDidUpdate
{
  UMUserListUpdateObserver **p_userListUpdateObserver;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  id v7;

  sub_18FAF3464(self);
  if (self)
  {
    p_userListUpdateObserver = &self->_userListUpdateObserver;
    WeakRetained = objc_loadWeakRetained((id *)p_userListUpdateObserver);

    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)p_userListUpdateObserver);
      objc_msgSend_userListDidUpdate(v7, v5, v6);

    }
  }
}

- (void)loadUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  UMUserManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_18FAEBD08();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18FAF36C4;
  v15[3] = &unk_1E2A4ABC8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  sub_18FAEBEE8((uint64_t)v11, self, v15);

}

- (void)createUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  UMUserManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_18FAEBD08();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18FAF391C;
  v15[3] = &unk_1E2A4ABC8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  sub_18FAEBEE8((uint64_t)v11, self, v15);

}

- (void)deleteUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UMUserManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sub_18FAEBD08();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAF3BA0;
  v11[3] = &unk_1E2A4ABF0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)disableUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sub_18FAEBD08();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAF3E00;
  v11[3] = &unk_1E2A4AC18;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)registerUserListUpdateObserver:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  obj = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    sub_18FAED518((uint64_t)UMAbort, CFSTR("%@ does not implement necessary observer methods"), v4, v5, v6, v7, v8, v9, (uint64_t)obj);
  v10 = obj;
  if (self)
  {
    objc_storeWeak((id *)&self->_userListUpdateObserver, obj);
    v10 = obj;
  }

}

- (void)switchToLoginUserWithCompletionHandler:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_switchToLoginUserWithError_completionHandler_, 0);
}

- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[5];
  id v56;

  v6 = a3;
  v7 = a4;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = sub_18FAF421C;
  v55[3] = &unk_1E2A4AC40;
  v55[4] = self;
  v8 = v7;
  v56 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v55);
  if (!objc_msgSend_isSharedIPad(self, v10, v11))
  {
    v28 = 0;
    goto LABEL_6;
  }
  sub_18FAF6AF0();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v12, CFSTR("Switch to login screen"), v13, v14, v15, v16, v17, v18, v53);

  if (self)
  {
    if (self->_switchIsOccurring)
    {
      sub_18FAF6AF0();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v21, CFSTR("A switch was already initiated"), v22, v23, v24, v25, v26, v27, v54);

      v28 = 5;
LABEL_6:
      sub_18FAEC284((uint64_t)UMError, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v29);
      goto LABEL_7;
    }
    self->_switchIsOccurring = 1;
  }
  if (v6)
  {
    objc_msgSend_currentUser(self, v19, v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend_mutableCopy(v30, v31, v32);

    objc_msgSend_setErrorCausingLogout_(v33, v34, (uint64_t)v6);
    objc_msgSend_setDebugErrorCausingLogout_(v33, v35, (uint64_t)v6);
    objc_msgSend_commitChanges(v33, v36, v37);
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("An error caused this switch"), v38, v39, v40, v41, v42, v43, v54);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAF8F3C((uint64_t)v44, CFSTR("Error: %@"), v45, v46, v47, v48, v49, v50, (uint64_t)v6);
    sub_18FAEBC90();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v51, v44);

  }
  sub_18FAE7234();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_switchToLoginUserWithCompletionHandler_(v29, v52, (uint64_t)v9);
LABEL_7:

}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26[5];
  id v27;

  v4 = a3;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = (uint64_t)sub_18FAF43DC;
  v26[3] = (uint64_t)&unk_1E2A4AC40;
  v26[4] = (uint64_t)self;
  v5 = v4;
  v27 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v26);
  if (!objc_msgSend_isSharedIPad(self, v7, v8))
  {
    v23 = 0;
    goto LABEL_6;
  }
  sub_18FAE9AB8();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v9, CFSTR("Switch to login screen"), v10, v11, v12, v13, v14, v15, v26[0]);

  if (!self)
  {
LABEL_8:
    sub_18FAE7234();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logoutToLoginSessionWithCompletionHandler_(v24, v25, (uint64_t)v6);
    goto LABEL_9;
  }
  if (!self->_switchIsOccurring)
  {
    self->_switchIsOccurring = 1;
    goto LABEL_8;
  }
  sub_18FAE9AB8();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v16, CFSTR("A switch was already initiated"), v17, v18, v19, v20, v21, v22, v26[0]);

  v23 = 5;
LABEL_6:
  sub_18FAEC284((uint64_t)UMError, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v24);
LABEL_9:

}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int isLoginUser;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  unint64_t v37;
  void *v38;
  _BOOL4 switchIsOccurring;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86[5];
  id v87;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = (uint64_t)sub_18FAF47F4;
  v86[3] = (uint64_t)&unk_1E2A4AC40;
  v86[4] = (uint64_t)self;
  v17 = v16;
  v87 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v86);
  if (!objc_msgSend_isSharedIPad(self, v19, v20))
  {
    sub_18FAEA1C0();
    v28 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v28;
    v36 = CFSTR("NOT IN MULTISUER/LOGINUSER directswitch not Supported");
    goto LABEL_5;
  }
  objc_msgSend_currentUser(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isLoginUser = objc_msgSend_isLoginUser(v23, v24, v25);

  if (isLoginUser)
  {
    sub_18FAEA1C0();
    v28 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v28;
    v36 = CFSTR("directswitch from LoginUI User notsupported");
LABEL_5:
    sub_18FAE71DC(v28, v36, v29, v30, v31, v32, v33, v34, v86[0]);

    v37 = 0;
LABEL_6:
    sub_18FAEC284((uint64_t)UMError, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!objc_msgSend_userExists_(self, v27, (uint64_t)v12))
  {
    sub_18FAEA1C0();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v48, CFSTR("directswitch non existing user"), v49, v50, v51, v52, v53, v54, v86[0]);

    v37 = 2;
    goto LABEL_6;
  }
  if (self)
  {
    switchIsOccurring = self->_switchIsOccurring;
    sub_18FAEA1C0();
    v40 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v40;
    if (switchIsOccurring)
    {
      sub_18FAE71DC(v40, CFSTR("switch(from directswitch) was already initiated"), v41, v42, v43, v44, v45, v46, v86[0]);

      v37 = 5;
      goto LABEL_6;
    }
    sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("DirectSwitch to user"), v42, v43, v44, v45, v46, v86[0]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v47, v55);

    self->_switchIsOccurring = 1;
  }
  else
  {
    sub_18FAEA1C0();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("DirectSwitch to user"), v80, v81, v82, v83, v84, v86[0]);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v79, v85);

  }
  sub_18FAEEC8C((uint64_t)UMMobileKeyBag, v12, v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAEA1C0();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("loaduser NO ERROR"), v56, v57, v58, v59, v60, v86[0]);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v61, v63);

    v66 = (void *)objc_msgSend_mutableCopy(v12, v64, v65);
    objc_msgSend_setDebugErrorCausingLogout_(v66, v67, 0);
    objc_msgSend_commitChanges(v66, v68, v69);
    sub_18FAEA1C0();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("calling xpcserver direct switch user"), v71, v72, v73, v74, v75, v86[0]);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v70, v76);

    sub_18FAE7234();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_directSwitchToUser_passcodeData_context_preferences_completionHandler_(v77, v78, (uint64_t)v12, v13, v14, v15, v18);

    goto LABEL_8;
  }
  sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("load user failed"), v56, v57, v58, v59, v60, v86[0]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v61, v62);

LABEL_7:
  ((void (**)(_QWORD, void *))v18)[2](v18, v38);
LABEL_8:

}

- (void)loginUICheckInWithCompletionHandler:(id)a3
{
  id v3;
  const char *v4;
  id v5;

  v3 = a3;
  sub_18FAE7234();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginUICheckInWithCompletionHandler_(v5, v4, (uint64_t)v3);

}

- (void)registerUserSwitchStakeHolder:(id)a3
{
  objc_msgSend_registerUserSwitchStakeHolder_completionHandler_(self, a2, (uint64_t)a3, 0);
}

- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  sub_18FAE9AB8();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v7, CFSTR("Register user switch stakeholder"), v8, v9, v10, v11, v12, v13, v23);

  if ((objc_opt_respondsToSelector() & 1) == 0)
    sub_18FAED518((uint64_t)UMAbort, CFSTR("%@ does not implement necessary stakeholder methods"), v15, v16, v17, v18, v19, v20, (uint64_t)v24);
  if (objc_msgSend_isSharedIPad(self, v14, v15))
  {
    sub_18FAE7234();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registerUserSwitchStakeHolder_completionHandler_(v21, v22, (uint64_t)v24, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v5 = a4;
  sub_18FAE9AB8();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v6, CFSTR("Register user sync stakeholder"), v7, v8, v9, v10, v11, v12, v21);

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    sub_18FAED518((uint64_t)UMAbort, CFSTR("%@ does not implement necessary stakeholder methods"), v13, v14, v15, v16, v17, v18, (uint64_t)v22);
  sub_18FAE7234();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(v19, v20, (uint64_t)v22, v5);

}

- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;

  v7 = a5;
  v8 = a3;
  sub_18FAE7234();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterStakeHolder_status_reason_(v10, v9, (uint64_t)v8, a4, v7);

}

- (void)terminateSyncWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(void);

  v16 = (void (**)(void))a3;
  sub_18FAE9AB8();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("Terminate sync"), v5, v6, v7, v8, v9, v10, v15);

  if (objc_msgSend_isSharedIPad(self, v11, v12))
  {
    sub_18FAE7234();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_terminateSyncWithCompletionHandler_(v13, v14, (uint64_t)v16);

  }
  else if (v16)
  {
    v16[2]();
  }

}

- (void)resumeSync
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  sub_18FAE9AB8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("Resume sync"), v4, v5, v6, v7, v8, v9, v14);

  if (objc_msgSend_isSharedIPad(self, v10, v11))
  {
    sub_18FAE7234();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resumeSync(v15, v12, v13);

  }
}

- (void)createUserPersona:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_createUserPersona_passcodeData_passcodeDataType_completionHandler_, a3);
}

- (void)createUserPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  sub_18FAE7234();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFECC0((uint64_t)v12, v11, v10, a5, v9);

}

- (void)deleteUserPersonaWithIDString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_deleteUserPersonaWithPersonaUniqueString_passcodeData_completionHandler_, a3);
}

- (void)deleteUserPersonaWithPersonaUniqueString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = kUMUserPersonaUniqueStringKey;
  v15[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v11, (uint64_t)v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  sub_18FAFEE58((uint64_t)v13, v12, (uint64_t)v9, v8);
}

- (void)deleteUserPersonaWithType:(int)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  _QWORD v16[2];

  v6 = *(_QWORD *)&a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a4;
  objc_msgSend_numberWithInt_(v7, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = kUMUserPersonaTypeKey;
  v16[0] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFEE58((uint64_t)v14, v13, (uint64_t)v9, v8);

}

- (void)deleteUserPersonaWithProfileInfo:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  sub_18FAE7234();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFEE58((uint64_t)v10, v9, (uint64_t)v8, v7);

}

- (void)disableUserPersonaWithProfileInfo:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  sub_18FAE7234();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFEFC8((uint64_t)v7, v6, v5);

}

- (void)fetchPersonaWithIDString:(id)a3 CompletionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_fetchPersonaWithPersonaUniqueString_completionHandler_, a3);
}

- (void)fetchPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = kUMUserPersonaUniqueStringKey;
  v12[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  sub_18FAFF93C((uint64_t)v10, v9, v6);
}

- (void)fetchPersonaWithType:(int)a3 CompletionHandler:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  _QWORD v13[2];

  v4 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend_numberWithInt_(v5, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = kUMUserPersonaTypeKey;
  v13[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF93C((uint64_t)v11, v10, v6);

}

- (void)fetchAllPersonasWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  sub_18FAE7234();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFF138((uint64_t)v4, v3);

}

- (void)fetchAllPersonasForAllUsersWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  sub_18FAE7234();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFF290((uint64_t)v4, v3);

}

- (void)fetchAsidMapOfAllUsersWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  sub_18FAE7234();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFFE74((uint64_t)v4, v3);

}

- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaWithIDString:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_setBundlesIdentifiers_forPersonaWithPersonaUniqueString_completionHandler_, a3);
}

- (void)setBundlesIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = kUMUserPersonaUniqueStringKey;
  v15[0] = a4;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v11, (uint64_t)v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  sub_18FAFFFCC((uint64_t)v13, v10, v12, v8);
}

- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaType:(int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  _QWORD v16[2];

  v5 = *(_QWORD *)&a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a3;
  objc_msgSend_numberWithInt_(v7, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = kUMUserPersonaTypeKey;
  v16[0] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFFFCC((uint64_t)v14, v9, v13, v8);

}

- (void)setMultiPersonaBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  sub_18FAE7234();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FB00694((uint64_t)v7, v6, v5);

}

- (void)fetchBundleIdentifierForPersonaWithIDString:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_fetchBundleIdentifierForPersonaWithPersonaUniqueString_completionHandler_, a3);
}

- (void)fetchBundleIdentifierForPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = kUMUserPersonaUniqueStringKey;
  v12[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  sub_18FB00520((uint64_t)v10, v9, v6);
}

- (void)fetchBundleIdentifierForType:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  _QWORD v13[2];

  v4 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend_numberWithInt_(v5, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = kUMUserPersonaTypeKey;
  v13[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FB00520((uint64_t)v11, v10, v6);

}

- (void)fetchMultiPersonaBundleIdentifierWithcompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  sub_18FAE7234();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FB00804((uint64_t)v4, v3);

}

- (id)bundleIdentifiersforPersonaWithPersonaUniqueString:(id)a3 withError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a3;
  if ((objc_msgSend_isSharedIPad(self, v7, v8) & 1) != 0)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v9, *MEMORY[0x1E0CB2FE0], 45, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    sub_18FAE7234();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    sub_18FB0095C(v12, v6, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (!a4)
      goto LABEL_7;
  }
  if (v10)
    *a4 = objc_retainAutorelease(v10);
LABEL_7:

  return v11;
}

- (BOOL)setBundleIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  BOOL v14;
  void *v15;
  id v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend_isSharedIPad(self, v10, v11) & 1) != 0)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, *MEMORY[0x1E0CB2FE0], 45, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    sub_18FAE7234();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v14 = sub_18FB00150(v15, v8, v9, &v17);
    v13 = v17;

    if (!a5)
      goto LABEL_7;
  }
  if (v13)
    *a5 = objc_retainAutorelease(v13);
LABEL_7:

  return v14;
}

- (id)listAllPersonaAttributesWithError:(id *)a3
{
  id *v3;
  const char *v4;
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  int v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v59;
  id obj;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v3 = a3;
  v69 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (objc_msgSend_isSharedIPad(self, a2, (uint64_t)a3))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, *MEMORY[0x1E0CB2FE0], 45, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  sub_18FAE7234();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  sub_18FAFF3E8(v6, &v67);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v67;

  if (!v7)
  {
LABEL_25:
    obj = 0;
    v18 = 0;
    v56 = (id)MEMORY[0x1E0C9AA60];
    if (!v3)
      goto LABEL_34;
    goto LABEL_32;
  }
  v59 = (uint64_t)v3;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_arrayWithCapacity_(v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v7;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v63, v68, 16);
  if (v15)
  {
    v17 = v15;
    v18 = 0;
    v19 = *(_QWORD *)v64;
    v20 = &OBJC_IVAR___UMUserPersonaContext__voucher;
LABEL_8:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v19)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v21);
      objc_msgSend_objectForKeyedSubscript_(v22, v16, (uint64_t)kUMUserPersonaUniqueStringKey);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        break;
      objc_msgSend_objectForKeyedSubscript_(v22, v24, *((_QWORD *)v20 + 202));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend_objectForKeyedSubscript_(v22, v31, *((_QWORD *)v20 + 202));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v32;
        if (v32)
        {
          v36 = objc_msgSend_integerValue(v32, v33, v34);
          v61 = v5;
          objc_msgSend_personaAttributesForPersonaType_withError_(UMUserPersonaAttributes, v37, v36, &v61);
          v38 = objc_claimAutoreleasedReturnValue();
          v28 = v61;

          if (!v38)
          {

LABEL_30:
            v18 = 0;
            v56 = (id)MEMORY[0x1E0C9AA60];
            v5 = v28;
            goto LABEL_31;
          }
          objc_msgSend_addObject_(v13, v39, v38);
          v18 = (void *)v38;
          v5 = v28;
        }
        else
        {
          sub_18FAEA1C0();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Invalid Persona type"), v49, v50, v51, v52, v53, v54, v59);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v48, v55);

        }
        goto LABEL_21;
      }
      sub_18FAEA1C0();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Invalid Persona attrib"), v41, v42, v43, v44, v45, v46, v59);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v40, v47);

LABEL_22:
      if (v17 == ++v21)
      {
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v63, v68, 16);
        if (v17)
          goto LABEL_8;
        goto LABEL_28;
      }
    }
    objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)kUMUserPersonaUniqueStringKey);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v5;
    objc_msgSend_personaAttributesForPersonaUniqueString_withError_(UMUserPersonaAttributes, v26, (uint64_t)v25, &v62);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v62;

    if (!v27)
      goto LABEL_30;
    objc_msgSend_addObject_(v13, v29, v27);
    v5 = v28;
    v18 = (void *)v27;
LABEL_21:
    v20 = &OBJC_IVAR___UMUserPersonaContext__voucher;
    goto LABEL_22;
  }
  v18 = 0;
LABEL_28:

  v56 = v13;
LABEL_31:
  v3 = (id *)v59;

  if (v59)
  {
LABEL_32:
    if (v5)
      *v3 = objc_retainAutorelease(v5);
  }
LABEL_34:
  v57 = v56;

  return v57;
}

- (id)listAllPersonaWithAttributes
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v3 = 4;
  while (1)
  {
    objc_msgSend_listAllPersonaAttributesWithError_(self, a2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      break;
    if (--v3 <= 1)
      goto LABEL_6;
  }
  v6 = v4;
LABEL_6:

  return v5;
}

- (BOOL)haveValidPersonaContextForIDString:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_haveValidPersonaContextForPersonaUniqueString_, a3);
}

- (BOOL)haveValidPersonaContextForPersonaUniqueString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend_currentPersona(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    objc_msgSend_userPersonaUniqueString(v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_compare_(v11, v12, (uint64_t)v4) == 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)personaLoginWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5
{
  id v6;

  if (a5)
  {
    *a5 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB2FE0], 45, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v6;

  }
  return 0;
}

- (BOOL)personaLogoutWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5
{
  id v6;

  if (a5)
  {
    *a5 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB2FE0], 45, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v6;

  }
  return 0;
}

- (void)registerPersonaListUpdateObserver:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_registerPersonaListUpdateObserver_withMachService_completionHandler_, a3);
}

- (void)registerPersonaListUpdateObserver:(id)a3 withMachService:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  sub_18FAE9AB8();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Registering registerPersonaListUpdateObserver"), v11, v12, v13, v14, v15, v16, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v10, v17);

  if (objc_msgSend_isSharedIPad(self, v18, v19))
  {
    v9[2](v9, 0);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      sub_18FAED518((uint64_t)UMAbort, CFSTR("%@ does not implement necessary observer methods"), v20, v21, v22, v23, v24, v25, (uint64_t)v28);
    sub_18FAE7234();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FB01860(v26, v28, v8, v9);

  }
}

- (void)setupUMUserSessionProvisioning:(id)a3 WithCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = a4;
  v6 = a3;
  sub_18FAE9AB8();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Provisioning iOS for sharediPad"), v8, v9, v10, v11, v12, v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v7, v14);

  sub_18FAE7234();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FB01A28(v16, v6, v5);

}

- (BOOL)migrateSharedAndPrimaryUserVolumeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id v26;

  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Migration of SDV & User volume  Requested"), v5, v6, v7, v8, v9, v10, v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v26 = 0;
  v12 = sub_18FAF00F4((uint64_t)UMMobileKeyBag, &v26);
  v13 = v26;
  sub_18FAEA1C0();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v21 = CFSTR("Migration of SDV & User volume  Completed");
  }
  else
  {
    v25 = (uint64_t)v13;
    v21 = CFSTR("Migration of SDV & User volume  failed with error:%@");
  }
  sub_18FAE99B4((uint64_t)UMLogMessage, v21, v14, v15, v16, v17, v18, v19, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v20, v22);

  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v12;
}

- (BOOL)migrateGuestUserVolume:(id)a3 withError:(id *)a4
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
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v26;
  id v27;

  v5 = a3;
  sub_18FAEA1C0();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Migration of PersonaVolume of Persona:%@ requested"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v6, v13);

  v27 = 0;
  v14 = sub_18FAF036C((uint64_t)UMMobileKeyBag, v5, &v27);

  v15 = v27;
  sub_18FAEA1C0();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v23 = CFSTR("Migration of PersonaVolume  Completed");
  }
  else
  {
    v26 = (uint64_t)v15;
    v23 = CFSTR("Migration of PersonaVolume failed with error:%@");
  }
  sub_18FAE99B4((uint64_t)UMLogMessage, v23, v16, v17, v18, v19, v20, v21, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v22, v24);

  if (a4)
    *a4 = objc_retainAutorelease(v15);

  return v14;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userPersonaUpdateObserver);
  objc_destroyWeak((id *)&self->_userListUpdateObserver);
  objc_storeStrong((id *)&self->_allUsers, 0);
}

- (NSArray)allUsers
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_18FAEAA20;
  v11 = sub_18FAEA9F0;
  v12 = 0;
  sub_18FAEBDF8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18FAF6288;
  v6[3] = &unk_1E2A4AC68;
  v6[4] = &v7;
  sub_18FAE8C2C((uint64_t)v3, self, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)allUsersUnfiltered
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_18FAEAA20;
  v11 = sub_18FAEA9F0;
  v12 = 0;
  sub_18FAEBDF8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18FAF63E8;
  v6[3] = &unk_1E2A4AC68;
  v6[4] = &v7;
  sub_18FAE8C2C((uint64_t)v3, self, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)userExists:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend_allUsers(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        if ((objc_msgSend_isEqualToUser_(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i), v9, (uint64_t)v4) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)keybagOpaqueDataForUser:(id)a3 withError:(id *)a4
{
  return sub_18FAF1350((uint64_t)UMMobileKeyBag, a3, a4);
}

- (BOOL)setKeybagOpaqueDataForUser:(id)a3 withOpaqueData:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  char v12;
  id v13;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend_userExists_(self, v10, (uint64_t)v8))
  {
    v12 = sub_18FAF1740((uint64_t)UMMobileKeyBag, v8, v9, a5);
    v13 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2FE0], 2, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (a5 && v13)
    {
      v13 = objc_retainAutorelease(v13);
      v12 = 0;
      *a5 = v13;
    }
  }

  return v12;
}

- (void)registerCriticalUserSwitchStakeHolder:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  sub_18FAE9AB8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("Register critical user switch stakeholder"), v4, v5, v6, v7, v8, v9, v18);

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    sub_18FAED518((uint64_t)UMAbort, CFSTR("%@ does not implement necessary stakeholder methods"), v10, v11, v12, v13, v14, v15, (uint64_t)v19);
  sub_18FAE7234();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerCriticalUserSwitchStakeHolder_(v16, v17, (uint64_t)v19);

}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int isLoginUser;
  const char *v27;
  uint64_t v28;
  _BOOL4 switchIsOccurring;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, void *);
  void *v59;
  UMUserManager *v60;
  id v61;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v56 = MEMORY[0x1E0C809B0];
  v57 = 3221225472;
  v58 = sub_18FAF69B0;
  v59 = &unk_1E2A4AC40;
  v60 = self;
  v17 = v16;
  v61 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](&v56);
  if (objc_msgSend_isSharedIPad(self, v19, v20))
  {
    objc_msgSend_currentUser(self, v21, v22, v56, v57, v58, v59, v60);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isLoginUser = objc_msgSend_isLoginUser(v23, v24, v25);

    if (!isLoginUser)
    {
      v38 = 0;
      goto LABEL_12;
    }
  }
  if (!objc_msgSend_isSharedIPad(self, v21, v22, v56)
    || !objc_msgSend_isLoginUser(v12, v27, v28))
  {
    if (objc_msgSend_userExists_(self, v27, (uint64_t)v12))
    {
      if (self)
      {
        switchIsOccurring = self->_switchIsOccurring;
        sub_18FAF6AF0();
        v30 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v30;
        if (switchIsOccurring)
        {
          sub_18FAE71DC(v30, CFSTR("A switch was already initiated"), v31, v32, v33, v34, v35, v36, v56);

          v38 = 5;
LABEL_12:
          sub_18FAEC284((uint64_t)UMError, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("Switch to user"), v32, v33, v34, v35, v36, v56);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v37, v40);

        self->_switchIsOccurring = 1;
      }
      else
      {
        sub_18FAF6AF0();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAF90A4((uint64_t)UMLogMessage, v12, CFSTR("Switch to user"), v50, v51, v52, v53, v54, v56);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v49, v55);

      }
      sub_18FAEEC8C((uint64_t)UMMobileKeyBag, v12, v13);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        v43 = (void *)objc_msgSend_mutableCopy(v12, v41, v42);
        objc_msgSend_setDebugErrorCausingLogout_(v43, v44, 0);
        objc_msgSend_commitChanges(v43, v45, v46);
        sub_18FAE7234();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_(v47, v48, (uint64_t)v12, v13, v14, v15, v18);

        goto LABEL_14;
      }
LABEL_13:
      ((void (**)(_QWORD, void *))v18)[2](v18, v39);
LABEL_14:

      goto LABEL_15;
    }
    v38 = 2;
    goto LABEL_12;
  }
  v18[2](v18, 0);
LABEL_15:

}

- (void)suspendQuotasWithCompletionHandler:(id)a3
{
  id v3;
  const char *v4;
  id v5;

  v3 = a3;
  sub_18FAE7234();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_suspendQuotasWithCompletionHandler_(v5, v4, (uint64_t)v3);

}

- (void)resumeQuotas
{
  const char *v2;
  uint64_t v3;
  id v4;

  sub_18FAE7234();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resumeQuotas(v4, v2, v3);

}

- (void)userInteractionIsEnabled
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend_isSharedIPad(self, a2, v2))
  {
    sub_18FAE7234();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userInteractionIsEnabled(v5, v3, v4);

  }
}

- (id)currentUserSwitchContext
{
  return sub_18FAEE5C4();
}

- (void)currentUserSwitchContextHasBeenUsed
{
  sub_18FAEE960();
}

@end
