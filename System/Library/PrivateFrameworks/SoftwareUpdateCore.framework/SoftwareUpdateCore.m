id SUCoreBorder_MSUPreflightUpdate(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v2 = a2;
  v12 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUPreflightUpdate"), &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = MSUPreflightUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUPreflightUpdate"), &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);

    }
    if ((v8 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12))
    goto LABEL_9;
LABEL_3:
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUPreflightUpdate"), CFSTR("preflight (prior to SU download) was successful with error"), 0, v12);

  }
  v7 = 0;
LABEL_10:

  return v7;
}

id _SUCoreBorder_MSUFunctionAtBegin(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DA8988];
  v4 = a1;
  objc_msgSend(v3, "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin:atFunction:", CFSTR("msu"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "simAction") == 1)
    {
      _SUCoreBorder_MSUSetSimulatedError(v6, (uint64_t)a2);
    }
    else if (objc_msgSend(v6, "simAction") == 3)
    {
      if (a2)
        *a2 = 0;
    }
    else
    {

      v6 = 0;
    }
  }
  return v6;
}

id _SUCoreBorder_MSUFunctionAtEnd(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DA8988];
  v4 = a1;
  objc_msgSend(v3, "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end:atFunction:", CFSTR("msu"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "simAction") == 1)
    {
      _SUCoreBorder_MSUSetSimulatedError(v6, (uint64_t)a2);
    }
    else if (objc_msgSend(v6, "simAction") == 3)
    {
      if (a2)
        *a2 = 0;
    }
    else
    {

      v6 = 0;
    }
  }
  return v6;
}

uint64_t _SUCoreBorder_MSUSimulate(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a1;
  v6 = objc_msgSend(v5, "simAction");
  if (v6 == 3)
  {
    if (a3)
      *a3 = 0;
    a2 = 1;
  }
  else if (v6 == 1)
  {
    _SUCoreBorder_MSUSetSimulatedError(v5, (uint64_t)a3);
    a2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MSUSimulate"), v8, 8113, 0);

  }
  return a2;
}

id SUCoreBorder_MSUPrepareUpdateWithMAAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = a1;
  v4 = a2;
  v14 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUPrepareUpdateWithMAAsset"), &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (_SUCoreBorder_MSUSimulate(v5, 1, &v14))
    {
LABEL_3:
      if (!v14)
      {
        v9 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUPrepareUpdateWithMAAsset"), CFSTR("prepare was successful with error"), 0, v14);

      v9 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = MSUPrepareUpdateWithMAAsset();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUPrepareUpdateWithMAAsset"), &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      LOBYTE(v10) = _SUCoreBorder_MSUSimulate(v11, v10, &v14);

    }
    if ((v10 & 1) != 0)
      goto LABEL_3;
  }
  v9 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildError:underlying:description:", 8804, 0, CFSTR("MSUPrepareUpdateWithMAAsset was not successful (yet no error provided)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
LABEL_12:

  return v9;
}

id SUCoreBorder_MSUPrepareUpdate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = a1;
  v4 = a2;
  v14 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUPrepareUpdate"), &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (_SUCoreBorder_MSUSimulate(v5, 1, &v14))
    {
LABEL_3:
      if (!v14)
      {
        v9 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUPrepareUpdate"), CFSTR("prepare was successful with error"), 0, v14);

      v9 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = MSUPrepareUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUPrepareUpdate"), &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      LOBYTE(v10) = _SUCoreBorder_MSUSimulate(v11, v10, &v14);

    }
    if ((v10 & 1) != 0)
      goto LABEL_3;
  }
  v9 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildError:underlying:description:", 8804, 0, CFSTR("MSUPrepareUpdate was not successful (yet no error provided)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
LABEL_12:

  return v9;
}

id SUCoreBorder_MSUApplyUpdate(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v2 = a2;
  v12 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUApplyUpdate"), &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = MSUApplyUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUApplyUpdate"), &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);

    }
    if ((v8 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12))
    goto LABEL_9;
LABEL_3:
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUApplyUpdate"), CFSTR("apply was successful with error"), 0, v12);

  }
  v7 = 0;
LABEL_10:

  return v7;
}

id SUCoreBorder_MSUSuspendUpdate()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;

  v9 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUSuspendUpdate"), &v9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
    v5 = MSUSuspendUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUSuspendUpdate"), &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);

    }
    if ((v5 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = v9;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v0, 1, &v9))
    goto LABEL_9;
LABEL_3:
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    objc_msgSend(v2, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUSuspendUpdate"), CFSTR("suspend was successful with error"), 0, v9);

  }
  v4 = 0;
LABEL_10:

  return v4;
}

id SUCoreBorder_MSUPurgeSuspendedUpdate()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;

  v9 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUPurgeSuspendedUpdate"), &v9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
    v5 = MSUPurgeSuspendedUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUPurgeSuspendedUpdate"), &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);

    }
    if ((v5 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = v9;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v0, 1, &v9))
    goto LABEL_9;
LABEL_3:
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    objc_msgSend(v2, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUPurgeSuspendedUpdate"), CFSTR("purge suspeneded update was successful with error"), 0, v9);

  }
  v4 = 0;
LABEL_10:

  return v4;
}

id SUCoreBorder_MSUResumeUpdateWithOptions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  v11 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUResumeUpdateWithOptions"), &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7 = MSUResumeUpdateWithOptions();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUResumeUpdateWithOptions"), &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);

    }
    if ((v7 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11))
    goto LABEL_9;
LABEL_3:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUResumeUpdateWithOptions"), CFSTR("resume was successful with error"), 0, v11);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSUBrainIsLoadable(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t IsLoadable;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  v11 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUUpdateBrainIsLoadable"), &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    IsLoadable = MSUBrainIsLoadable();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUUpdateBrainIsLoadable"), &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(IsLoadable) = _SUCoreBorder_MSUSimulate(v8, IsLoadable, &v11);

    }
    if ((IsLoadable & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11))
    goto LABEL_9;
LABEL_3:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUBrainIsLoadable"), CFSTR("brainIsLoadable returned YES with error"), 0, v11);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSUAssetCalculatePrepareSize(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  v11 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUAssetCalculatePrepareSize"), &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7 = MSUAssetCalculatePrepareSize();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUAssetCalculatePrepareSize"), &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);

    }
    if ((v7 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11))
    goto LABEL_9;
LABEL_3:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUAssetCalculatePrepareSize"), CFSTR("asset calculate prepare size was successful with error"), 0, v11);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSUAssetCalculateApplySize(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  v11 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUAssetCalculateApplySize"), &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7 = MSUAssetCalculateApplySize();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUAssetCalculateApplySize"), &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);

    }
    if ((v7 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11))
    goto LABEL_9;
LABEL_3:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUAssetCalculateApplySize"), CFSTR("asset calculate apply size was successful with error"), 0, v11);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

uint64_t SUCoreBorder_MSURetrievePreviousUpdateState()
{
  void *v0;
  void *v1;
  uint64_t updated;
  void *v3;
  void *v4;

  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSURetrievePreviousUpdateState"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    updated = _SUCoreBorder_MSUSimulate(v0, 1, 0);
  }
  else
  {
    updated = MSURetrievePreviousUpdateState();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSURetrievePreviousUpdateState"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      updated = _SUCoreBorder_MSUSimulate(v3, updated, 0);

  }
  return updated;
}

id SUCoreBorder_MSUGetUpdateInfo(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUGetUpdateInfo"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    _SUCoreBorder_MSUGetUpdateInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MSUGetUpdateInfo();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUGetUpdateInfo"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      _SUCoreBorder_MSUGetUpdateInfo(v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }

  }
  return v7;
}

id _SUCoreBorder_MSUGetUpdateInfo(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "simAction");
  if (v2 == 1)
  {
    v5 = 0;
  }
  else
  {
    if (v2 == 3)
    {
      v3 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v1, "updateInfoPlist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v1);
      objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MSUGetUpdateInfo"), v6, 8113, 0);

      v5 = 0;
    }

  }
  return v5;
}

id SUCoreBorder_MSUCommitStash(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  v11 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSUCommitStash"), &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7 = MSUCommitStash();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSUCommitStash"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);

    }
    if ((v7 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11))
    goto LABEL_9;
LABEL_3:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUCommitStash"), CFSTR("StashCommit was successful with error"), 0, v11);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSURollbackUpdatePrepare(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v2 = a2;
  v12 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSURollbackUpdatePrepare"), &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = MSUPrepareUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSURollbackUpdatePrepare"), &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);

    }
    if ((v8 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12))
    goto LABEL_9;
LABEL_3:
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSURollbackUpdate"), CFSTR("rollback was successful with error"), 0, v12);

  }
  v7 = 0;
LABEL_10:

  return v7;
}

id SUCoreBorder_MSURollbackUpdateSuspend()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;

  v9 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSURollbackUpdateSuspend"), &v9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
    v5 = MSUSuspendUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSURollbackUpdateSuspend"), &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);

    }
    if ((v5 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = v9;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v0, 1, &v9))
    goto LABEL_9;
LABEL_3:
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    objc_msgSend(v2, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSURollbackUpdateSuspend"), CFSTR("suspend was successful with error"), 0, v9);

  }
  v4 = 0;
LABEL_10:

  return v4;
}

id SUCoreBorder_MSURollbackUpdateResumeWithOptions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  v11 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSURollbackUpdateResume"), &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7 = MSUResumeUpdateWithOptions();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSURollbackUpdateResume"), &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);

    }
    if ((v7 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11))
    goto LABEL_9;
LABEL_3:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSURollbackUpdateResumeWithOptions"), CFSTR("resume was successful with error"), 0, v11);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSURollbackUpdateApply(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v2 = a2;
  v12 = 0;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("MSURollbackUpdateApply"), &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = MSUApplyUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(CFSTR("MSURollbackUpdateApply"), &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);

    }
    if ((v8 & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12))
    goto LABEL_9;
LABEL_3:
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_MSUApplyUpdate"), CFSTR("apply was successful with error"), 0, v12);

  }
  v7 = 0;
LABEL_10:

  return v7;
}

uint64_t _SUCoreBorder_MSUSetSimulatedError(void *a1, uint64_t a2)
{
  id v3;
  void *v4;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    if (*(_QWORD *)a2)
    {
      a2 = 0;
    }
    else
    {
      objc_msgSend(v3, "buildErrorWithDescription:", CFSTR("_SUCoreBorder_MSUSetSimulatedError"));
      *(_QWORD *)a2 = objc_claimAutoreleasedReturnValue();
      a2 = 1;
    }
  }

  return a2;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void SUCoreBorder_MAPurgeAll(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id *v6;
  id v7[5];
  void (**v8)(id, _QWORD);
  uint64_t *v9;
  id obj;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = (id *)&v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  obj = 0;
  _SUCoreBorder_MAFunctionAtBegin(CFSTR("MAPurgeAll"), &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v16, obj);
  if (v5)
  {
    v6 = v12 + 5;
    v7[0] = v12[5];
    _SUCoreBorder_MASimulate(v5, v7);
    objc_storeStrong(v6, v7[0]);
    if (v4)
      ((void (**)(id, id))v4)[2](v4, v12[5]);
  }
  else
  {
    v7[1] = (id)MEMORY[0x1E0C809B0];
    v7[2] = (id)3221225472;
    v7[3] = __SUCoreBorder_MAPurgeAll_block_invoke;
    v7[4] = &unk_1EA877F70;
    v9 = &v11;
    v8 = v4;
    MAPurgeAll();

  }
  _Block_object_dispose(&v11, 8);

}

void sub_1DDFE4600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id _SUCoreBorder_MAFunctionAtBegin(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DA8988];
  v4 = a1;
  objc_msgSend(v3, "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin:atFunction:", CFSTR("ma"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "simAction") == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v6, a2);
    }
    else if (objc_msgSend(v6, "simAction") == 3)
    {
      if (a2)
        *a2 = 0;
    }
    else
    {

      v6 = 0;
    }
  }
  return v6;
}

id _SUCoreBorder_MAFunctionAtEnd(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DA8988];
  v4 = a1;
  objc_msgSend(v3, "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "simAction") == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v6, a2);
    }
    else if (objc_msgSend(v6, "simAction") == 3)
    {
      if (a2)
        *a2 = 0;
    }
    else
    {

      v6 = 0;
    }
  }
  return v6;
}

void _SUCoreBorder_MASimulate(void *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = objc_msgSend(v7, "simAction");
  if (v3 == 3)
  {
    v4 = v7;
    if (a2)
      *a2 = 0;
  }
  else
  {
    if (v3 == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v7, a2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v7);
      objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MASimulate"), v6, 8113, 0);

    }
    v4 = v7;
  }

}

void _SUCoreBorder_MASetSimulatedError(void *a1, _QWORD *a2)
{
  id v3;
  id v4;

  v3 = a1;
  if (a2 && !*a2)
  {
    v4 = v3;
    objc_msgSend(v3, "buildErrorWithDescription:", CFSTR("SUCoreError created by _SUCoreBorder_MASetSimulatedError"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = v4;
  }

}

uint64_t _isUpdateBrainAssetType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileAsset.MobileSoftwareUpdate.MacUpdateBrain"));
  }

  return v2;
}

id _getNewUpdateBrainMAAssetAttributesDictionary(void *a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v20 = -272716322;
  v5 = (objc_class *)MEMORY[0x1E0C99D50];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  v9 = (void *)objc_msgSend([v5 alloc], "initWithBytes:length:", &v20, 4);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = (void *)MGCopyAnswer();
  if (objc_msgSend(v11, "hasPrefix:", CFSTR("AudioAccessory")))
    v12 = 21;
  else
    v12 = 20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v13, CFSTR("_CompatibilityVersion"));

  objc_msgSend(v10, "setSafeObject:forKey:", v7, CFSTR("Build"));
  objc_msgSend(v10, "setSafeObject:forKey:", v6, CFSTR("AssetPurpose"));

  objc_msgSend(v10, "setSafeObject:forKey:", CFSTR("zip"), CFSTR("_CompressionAlgorithm"));
  objc_msgSend(v10, "setSafeObject:forKey:", CFSTR("9999099099000000"), CFSTR("_ContentVersion"));
  objc_msgSend(v10, "setSafeObject:forKey:", CFSTR("https://xp.apple.com/report"), CFSTR("_EventRecordingServiceURL"));
  objc_msgSend(v10, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_IsZipStreamable"));
  objc_msgSend(v10, "setSafeObject:forKey:", CFSTR("2072"), CFSTR("_MasteredVersion"));
  objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("_Measurement"));
  objc_msgSend(v10, "setSafeObject:forKey:", CFSTR("SHA-1"), CFSTR("_MeasurementAlgorithm"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v14, CFSTR("_UnarchivedSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v15, CFSTR("_DownloadSize"));

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setSafeObject:forKey:", v8, CFSTR("AssetType"));

  objc_msgSend(v16, "setSafeObject:forKey:", CFSTR("SimulatedUpdateBrainAssetId"), CFSTR("AssetId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSafeObject:forKey:", v17, CFSTR("AssetState"));

  v21[0] = CFSTR("AssetProperties");
  v21[1] = CFSTR("AssetAddedProperties");
  v22[0] = v10;
  v22[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id _getNewSoftwareUpdateMAAssetAttributesDictionary(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v46;
  int v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v46 = a1;
  v13 = a4;
  v47 = -272716322;
  v14 = (objc_class *)MEMORY[0x1E0C99D50];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  v19 = a2;
  v20 = (void *)objc_msgSend([v14 alloc], "initWithBytes:length:", &v47, 4);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "setSafeObject:forKey:", v19, CFSTR("Build"));
  objc_msgSend(v21, "setSafeObject:forKey:", v18, CFSTR("OSVersion"));

  objc_msgSend(MEMORY[0x1E0D4E050], "_translateBuildVersionToRestoreVersionTuple:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setSafeObject:forKey:", v22, CFSTR("RestoreVersion"));
  objc_msgSend(v21, "setSafeObject:forKey:", v22, CFSTR("TargetBridgeUpdateVersion"));
  objc_msgSend(v21, "setSafeObject:forKey:", v22, CFSTR("TargetSFRUpdateVersion"));
  objc_msgSend(v21, "setSafeObject:forKey:", v13, CFSTR("ReleaseType"));
  objc_msgSend(v21, "setSafeObject:forKey:", v17, CFSTR("PrerequisiteBuild"));

  objc_msgSend(v21, "setSafeObject:forKey:", v16, CFSTR("PrerequisiteOSVersion"));
  objc_msgSend(v21, "setSafeObject:forKey:", v15, CFSTR("AssetPurpose"));

  if (v13
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v13, "containsString:", CFSTR("Internal")) & 1) != 0)
  {
    v23 = CFSTR("PreRelease");
  }
  else
  {
    v23 = CFSTR("Release");
  }
  objc_msgSend(v21, "setSafeObject:forKey:", v23, CFSTR("SUDocumentationID"));
  objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("SimulatedBaseURL"), CFSTR("__BaseURL"));
  objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("SimulatedRelativePath"), CFSTR("__RelativePath"));
  if (objc_msgSend(v46, "containsString:", CFSTR("Documentation")))
  {
    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("SimulatedDevice"), CFSTR("Device"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSafeObject:forKey:", v24, CFSTR("SUSLAVersionRequired"));
  }
  else
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("SimulatedSupportedDeviceModels"), 0);
    objc_msgSend(v21, "setSafeObject:forKey:", v24, CFSTR("SupportedDeviceModels"));
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("SimulatedSupportedDevices"), 0);
    objc_msgSend(v21, "setSafeObject:forKey:", v25, CFSTR("SupportedDevices"));
    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("SimulatedSystemName"), CFSTR("SUProductSystemName"));
    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("Apple Inc."), CFSTR("SUPublisher"));
    objc_msgSend(v21, "setSafeObject:forKey:", v20, CFSTR("RSEPDigest"));
    objc_msgSend(v21, "setSafeObject:forKey:", v20, CFSTR("SEPDigest"));
    v26 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v21, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SUInstallTonightEnabled"));
    objc_msgSend(v21, "setSafeObject:forKey:", v26, CFSTR("SUMultiPassEnabled"));
    objc_msgSend(v21, "setSafeObject:forKey:", v26, CFSTR("SUConvReqd"));
    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("1234"), CFSTR("InstallationSize-Snapshot"));
    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("1234"), CFSTR("InstallationSize"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSafeObject:forKey:", v27, CFSTR("MinimumSystemPartition"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSafeObject:forKey:", v28, CFSTR("ActualMinimumSystemPartition"));

    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("https://ns.itunes.apple.com/nowserving"), CFSTR("__QueuingServiceURL"));
    objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("https://xp.apple.com/report"), CFSTR("_EventRecordingServiceURL"));
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 80);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v30, CFSTR("8"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 160);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v31, CFSTR("16"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 320);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v32, CFSTR("32"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 640);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v33, CFSTR("64"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1280);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v34, CFSTR("128"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1280);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v35, CFSTR("256"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1280);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v36, CFSTR("512"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1280);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v37, CFSTR("768"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1280);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSafeObject:forKey:", v38, CFSTR("1024"));

    objc_msgSend(v21, "setSafeObject:forKey:", v29, CFSTR("SystemPartitionPadding"));
  }

  objc_msgSend(v21, "setSafeObject:forKey:", v20, CFSTR("_Measurement"));
  objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("SHA-1"), CFSTR("_MeasurementAlgorithm"));
  v39 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v21, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("__CanUseLocalCacheServer"));
  objc_msgSend(v21, "setSafeObject:forKey:", v39, CFSTR("_IsZipStreamable"));
  objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("NeverCollected"), CFSTR("__AssetDefaultGarbageCollectionBehavior"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSafeObject:forKey:", v40, CFSTR("_UnarchivedSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSafeObject:forKey:", v41, CFSTR("_DownloadSize"));

  objc_msgSend(v21, "setSafeObject:forKey:", CFSTR("zip"), CFSTR("_CompressionAlgorithm"));
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v42, "setSafeObject:forKey:", v46, CFSTR("AssetType"));
  objc_msgSend(v42, "setSafeObject:forKey:", CFSTR("SimulatedSoftwareUpdateAssetId"), CFSTR("AssetId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setSafeObject:forKey:", v43, CFSTR("AssetState"));

  v48[0] = CFSTR("AssetProperties");
  v48[1] = CFSTR("AssetAddedProperties");
  v49[0] = v21;
  v49[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

id _getNewDocumentationMAAssetAttributesDictionary(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v24 = -272716322;
  v9 = (objc_class *)MEMORY[0x1E0C99D50];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = a1;
  v15 = (void *)objc_msgSend([v9 alloc], "initWithBytes:length:", &v24, 4);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setSafeObject:forKey:", v13, CFSTR("Build"));

  objc_msgSend(v16, "setSafeObject:forKey:", v12, CFSTR("OSVersion"));
  objc_msgSend(v16, "setSafeObject:forKey:", v11, CFSTR("SUDocumentationID"));

  objc_msgSend(v16, "setSafeObject:forKey:", v10, CFSTR("AssetPurpose"));
  objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("_Measurement"));
  objc_msgSend(v16, "setSafeObject:forKey:", CFSTR("SHA-1"), CFSTR("_MeasurementAlgorithm"));
  v17 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v16, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("__CanUseLocalCacheServer"));
  objc_msgSend(v16, "setSafeObject:forKey:", v17, CFSTR("_IsZipStreamable"));
  objc_msgSend(v16, "setSafeObject:forKey:", CFSTR("NeverCollected"), CFSTR("__AssetDefaultGarbageCollectionBehavior"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSafeObject:forKey:", v18, CFSTR("_UnarchivedSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1234);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSafeObject:forKey:", v19, CFSTR("_DownloadSize"));

  objc_msgSend(v16, "setSafeObject:forKey:", CFSTR("zip"), CFSTR("_CompressionAlgorithm"));
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v20, "setSafeObject:forKey:", v14, CFSTR("AssetType"));

  objc_msgSend(v20, "setSafeObject:forKey:", CFSTR("SimulatedDocAssetId"), CFSTR("AssetId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSafeObject:forKey:", v21, CFSTR("AssetState"));

  v25[0] = CFSTR("AssetProperties");
  v25[1] = CFSTR("AssetAddedProperties");
  v26[0] = v16;
  v26[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1DE00097C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1DF0E6BC4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1DE001480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__75(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{

}

void sub_1DE001858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE001AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE001E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1DE0020FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DE0024AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE002D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE002F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE00323C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE0033AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *OUTLINED_FUNCTION_4()
{
  return __error();
}

char *OUTLINED_FUNCTION_5(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_7()
{
  return __error();
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id getUIImageClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUIImageClass_softClass;
  v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_1EA8791D8;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE01145C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitLibraryCore_frameworkLibrary)
  {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UIImage");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUIImageClass_block_invoke_cold_1();
    free(v3);
  }
  getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DE01BCD8(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_1();

    objc_end_catch();
    JUMPOUT(0x1DE01BCA8);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DE01C1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01C6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1DE01C820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01CB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DE01CF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01D280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01D5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01D8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01DDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01DFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DE01E358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01E63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE01EC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DE01EECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1DE022390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1DE026FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1DE027178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DE027320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DE0274B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DE029D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *SUCoreStringForDDMStatusNotificationType(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1EA8796F8[(__int16)a1];
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t preflightSUDownloadCallback(void *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "safeDescriptionWithName:", CFSTR("status"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] software update preflight download SU %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

uint64_t preflightPersonalizeCallback(void *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "safeDescriptionWithName:", CFSTR("status"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight personalize %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

uint64_t preflightFDRRecoveryCallback(void *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "safeDescriptionWithName:", CFSTR("status"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight FDRRecovery %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

uint64_t preflightWakeupCallback(void *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "safeDescriptionWithName:", CFSTR("status"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight wakeup %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

uint64_t preflightPrerequisiteCheckCallback(void *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "safeDescriptionWithName:", CFSTR("status"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight prerequisite check %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

void sub_1DE05D5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

uint64_t prepareCallback(uint64_t a1, id *a2)
{
  void *v5;
  NSObject *v6;
  void *v7;

  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(*a2, "prepareProgress:", a1);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      prepareCallback_cold_2();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      prepareCallback_cold_1();
  }

  return 0;
}

void sub_1DE05E250(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t applyCallback(uint64_t a1, id *a2)
{
  void *v5;
  NSObject *v6;
  void *v7;

  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(*a2, "applyProgress:", a1);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      applyCallback_cold_2();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      applyCallback_cold_1();
  }

  return 0;
}

void sub_1DE0601BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1DE06D070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SUCorePolicyDDMConfiguration initWithStatePersistencePath:].cold.1(v0);
}

void prepareCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[MSU] prepare callback with NULL context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void prepareCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[MSU] prepare callback with invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void applyCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[MSU] apply callback with NULL context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void applyCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[MSU] apply callback with invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume()
{
  return MEMORY[0x1E0D09B40]();
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x1E0D09B58]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1E0D09B80]();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB708](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

uint64_t MAPurgeAll()
{
  return MEMORY[0x1E0D4DFB8]();
}

uint64_t MAPurgeAllExceptGivenIds()
{
  return MEMORY[0x1E0D4DFC0]();
}

uint64_t MAStringForMADownloadResult()
{
  return MEMORY[0x1E0D4DFF8]();
}

uint64_t MAStringForMAQueryResult()
{
  return MEMORY[0x1E0D4E010]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MSUApplyUpdate()
{
  return MEMORY[0x1E0D4F6D8]();
}

uint64_t MSUAssetCalculateApplySize()
{
  return MEMORY[0x1E0D4F6E0]();
}

uint64_t MSUAssetCalculatePrepareSize()
{
  return MEMORY[0x1E0D4F6E8]();
}

uint64_t MSUBrainIsLoadable()
{
  return MEMORY[0x1E0D4F6F0]();
}

uint64_t MSUCommitStash()
{
  return MEMORY[0x1E0D4F6F8]();
}

uint64_t MSUGetUpdateInfo()
{
  return MEMORY[0x1E0D4F700]();
}

uint64_t MSUPreflightUpdate()
{
  return MEMORY[0x1E0D4F708]();
}

uint64_t MSUPrepareUpdate()
{
  return MEMORY[0x1E0D4F710]();
}

uint64_t MSUPrepareUpdateWithMAAsset()
{
  return MEMORY[0x1E0D4F718]();
}

uint64_t MSUPurgeSuspendedUpdate()
{
  return MEMORY[0x1E0D4F720]();
}

uint64_t MSUResumeUpdateWithOptions()
{
  return MEMORY[0x1E0D4F728]();
}

uint64_t MSURetrievePreviousUpdateState()
{
  return MEMORY[0x1E0D4F730]();
}

uint64_t MSUSuspendUpdate()
{
  return MEMORY[0x1E0D4F738]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _MSUPreferencesGetAppBooleanValueWithDefaultValue()
{
  return MEMORY[0x1E0D4F748]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1E0C84A18]();
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

uint64_t xpc_activity_copy_identifier()
{
  return MEMORY[0x1E0C85D88]();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

