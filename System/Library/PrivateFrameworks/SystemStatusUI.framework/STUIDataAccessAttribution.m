@implementation STUIDataAccessAttribution

- (STActivityAttribution)audioRecordingActivityAttribution
{
  void *v2;
  void *v3;

  -[STUIDataAccessAttribution microphoneRecordingAttribution](self, "microphoneRecordingAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STActivityAttribution *)v3;
}

- (BOOL)isRecent
{
  return self->_recent;
}

- (STAttributedEntity)attributedEntity
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[STUIDataAccessAttribution dataAccessType](self, "dataAccessType");
  switch(v4)
  {
    case 2uLL:
      -[STUIDataAccessAttribution locationAttribution](self, "locationAttribution");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[STUIDataAccessAttribution cameraCaptureAttribution](self, "cameraCaptureAttribution");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0uLL:
      -[STUIDataAccessAttribution microphoneRecordingAttribution](self, "microphoneRecordingAttribution");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = v5;
      objc_msgSend(v5, "activityAttribution");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attributedEntity");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return (STAttributedEntity *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STUIDataAccessAttribution dataAccessType](self, "dataAccessType");
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke;
  v39[3] = &unk_1E8D62F88;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v39);
  -[STUIDataAccessAttribution microphoneRecordingAttribution](self, "microphoneRecordingAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_2;
  v37[3] = &unk_1E8D62FB0;
  v11 = v8;
  v38 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v37);

  -[STUIDataAccessAttribution cameraCaptureAttribution](self, "cameraCaptureAttribution");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_3;
  v35[3] = &unk_1E8D62FB0;
  v14 = v11;
  v36 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v35);

  -[STUIDataAccessAttribution locationAttribution](self, "locationAttribution");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_4;
  v33[3] = &unk_1E8D62FB0;
  v17 = v14;
  v34 = v17;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", v16, v33);

  -[STUIDataAccessAttribution accessStartDate](self, "accessStartDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_5;
  v31[3] = &unk_1E8D62FB0;
  v20 = v17;
  v32 = v20;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", v19, v31);

  -[STUIDataAccessAttribution accessEndDate](self, "accessEndDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  v27 = 3221225472;
  v28 = __37__STUIDataAccessAttribution_isEqual___block_invoke_6;
  v29 = &unk_1E8D62FB0;
  v30 = v20;
  v23 = v20;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", v22, &v26);

  LOBYTE(v22) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);
  return (char)v22;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STUIDataAccessAttribution dataAccessType](self, "dataAccessType"));
  -[STUIDataAccessAttribution microphoneRecordingAttribution](self, "microphoneRecordingAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

  -[STUIDataAccessAttribution cameraCaptureAttribution](self, "cameraCaptureAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  -[STUIDataAccessAttribution locationAttribution](self, "locationAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  -[STUIDataAccessAttribution accessStartDate](self, "accessStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:", v11);

  -[STUIDataAccessAttribution accessEndDate](self, "accessEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:", v13);

  v15 = objc_msgSend(v3, "hash");
  return v15;
}

- (unint64_t)dataAccessType
{
  return self->_dataAccessType;
}

- (NSDate)accessStartDate
{
  return self->_accessStartDate;
}

- (STLocationStatusDomainLocationAttribution)locationAttribution
{
  return self->_locationAttribution;
}

- (STMediaStatusDomainCameraCaptureAttribution)cameraCaptureAttribution
{
  return self->_cameraCaptureAttribution;
}

- (NSDate)accessEndDate
{
  return self->_accessEndDate;
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)microphoneRecordingAttribution
{
  return self->_microphoneRecordingAttribution;
}

- (id)initWithDataAccessType:(void *)a3 microphoneRecordingAttribution:(void *)a4 cameraCaptureAttribution:(void *)a5 locationAttribution:(char)a6 recent:(void *)a7 startDate:(void *)a8 endDate:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  if (a1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)STUIDataAccessAttribution;
    v20 = objc_msgSendSuper2(&v32, sel_init);
    a1 = v20;
    if (v20)
    {
      v20[2] = a2;
      v21 = objc_msgSend(v15, "copy");
      v22 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v21;

      v23 = objc_msgSend(v16, "copy");
      v24 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v23;

      v25 = objc_msgSend(v17, "copy");
      v26 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v25;

      *((_BYTE *)a1 + 8) = a6;
      v27 = objc_msgSend(v18, "copy");
      v28 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v27;

      v29 = objc_msgSend(v19, "copy");
      v30 = (void *)*((_QWORD *)a1 + 7);
      *((_QWORD *)a1 + 7) = v29;

    }
  }

  return a1;
}

- (STUIDataAccessAttribution)initWithLocationAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  return (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 2, 0, 0, a3, a4, a5, a6);
}

- (STUIDataAccessAttribution)initWithCameraCaptureAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  return (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 1, 0, a3, 0, a4, a5, a6);
}

- (STUIDataAccessAttribution)initWithMicrophoneRecordingAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  return (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 0, a3, 0, 0, a4, a5, a6);
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataAccessType");
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cameraCaptureAttribution");
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "microphoneRecordingAttribution");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessEndDate, 0);
  objc_storeStrong((id *)&self->_accessStartDate, 0);
  objc_storeStrong((id *)&self->_locationAttribution, 0);
  objc_storeStrong((id *)&self->_cameraCaptureAttribution, 0);
  objc_storeStrong((id *)&self->_microphoneRecordingAttribution, 0);
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessStartDate");
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locationAttribution");
}

- (STUIDataAccessAttribution)initWithAudioRecordingActivityAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  STUIDataAccessAttribution *v15;

  v10 = (objc_class *)MEMORY[0x1E0DB0928];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithActivityAttribution:", v13);

  v15 = (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 0, v14, 0, 0, a4, v12, v11);
  return v15;
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessEndDate");
}

- (NSString)description
{
  return (NSString *)-[STUIDataAccessAttribution descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIDataAccessAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIDataAccessAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[STUIDataAccessAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__STUIDataAccessAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8D62C88;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __67__STUIDataAccessAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  unint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dataAccessType");
  if (v2 > 2)
    v3 = CFSTR("invalid");
  else
    v3 = off_1E8D62FD0[v2];
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v3, CFSTR("type"));
  if (objc_msgSend(*(id *)(a1 + 32), "isRecent"))
    v4 = CFSTR("recent");
  else
    v4 = CFSTR("active");
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v4, CFSTR("state"));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "accessStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("startDate"));

  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "accessEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v9, CFSTR("endDate"), 1);

  if (v2 == 2)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "locationAttribution");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == 1)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "cameraCaptureAttribution");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
      return;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "microphoneRecordingAttribution");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (id)v12;
  v13 = (id)objc_msgSend(v11, "appendObject:withName:");

}

@end
