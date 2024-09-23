@implementation VRFWitness

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A75A8;
  if (!qword_1002A75A8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VRFWitness, CFSTR("VRFWitness"), &unk_1002A2BE0, &off_1002A2B80, 3, 24, v3);
    qword_1002A75A8 = (uint64_t)result;
  }
  return result;
}

- (TransparencyVRFVerifier)verifier
{
  return (TransparencyVRFVerifier *)objc_getAssociatedObject(self, CFSTR("verifier"));
}

- (void)setVerifier:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("verifier"), a3, (void *)1);
}

- (NSData)message
{
  return (NSData *)objc_getAssociatedObject(self, CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("message"), a3, (void *)1);
}

- (id)diagnosticsJsonDictionary
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v12[0] = CFSTR("type");
  v3 = VRFType_EnumDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textFormatNameForValue:", -[VRFWitness type](self, "type")));
  v13[0] = v5;
  v12[1] = CFSTR("output");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness output](self, "output"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
  v13[1] = v7;
  v12[2] = CFSTR("proof");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness proof](self, "proof"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

  return v10;
}

- (unint64_t)verifyWithError:(id *)a3
{
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  TransparencyError *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint8_t buf[16];

  v5 = -[VRFWitness type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness verifier](self, "verifier"));
  v7 = objc_msgSend(v6, "vrfType");

  if (v5 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness verifier](self, "verifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness message](self, "message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness output](self, "output"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness proof](self, "proof"));
    v12 = objc_msgSend(v8, "verifyMessage:salt:output:proof:error:", v9, 0, v10, v11, a3);

    if ((v12 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness verifier](self, "verifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "key"));
      v18 = objc_msgSend(v17, "needsRefresh");

      if (v18)
        return 2;
      else
        return 0;
    }
  }
  else
  {
    if (a3)
    {
      v14 = +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -55, CFSTR("Unknown VRF algorithm used for VRF witness: %d"), VRFWitness_Type_RawValue((uint64_t)self));
      *a3 = (id)objc_claimAutoreleasedReturnValue(v14);
    }
    if (qword_1002A7B48 != -1)
      dispatch_once(&qword_1002A7B48, &stru_10024BF48);
    v15 = qword_1002A7B50;
    if (os_log_type_enabled((os_log_t)qword_1002A7B50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unknown VRF algorithm used for VRF witness", buf, 2u);
    }
    return 0;
  }
}

@end
