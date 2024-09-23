@implementation NSCoder

- (void)encodeMatrix4x4:(__n128)a3 forKey:(__n128)a4
{
  id v8;
  void *v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v8 = a7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10, 64));
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8, *(_OWORD *)&v10, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13);

}

- (__n128)decodeMatrix4x4ForKey:(void *)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v9;
  void *v10;
  simd_float4 v11;
  simd_float4 v12;

  v4 = a3;
  if (objc_msgSend(a1, "containsValueForKey:", v4))
  {
    v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), v4);
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    if ((unint64_t)objc_msgSend(v7, "length") <= 0x3F)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "simd_float4x4 GetMatrix4x4FromNSData(NSData *__strong)"));
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NIVisionSupport.mm"), 111, CFSTR("NSData must contain enough bytes for simd_float4x4"));

    }
    objc_msgSend(v7, "getBytes:length:", &v12, 64);

    v11 = v12;
  }
  else
  {
    v11 = matrix_identity_float4x4.columns[0];
  }

  return (__n128)v11;
}

- (void)encodeVector3:(id)a3 forKey:
{
  __int128 v3;
  id v5;
  void *v6;
  __int128 v7;

  v7 = v3;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 16));
  -[NSCoder encodeObject:forKey:](self, "encodeObject:forKey:", v6, v5, v7);

}

- (__n128)decodeVector3ForKey:(void *)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  if ((unint64_t)objc_msgSend(v7, "length") <= 0xF)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "simd_float3 GetVector3FromNSData(NSData *__strong)"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NINearbyObject.mm"), 663, CFSTR("NSData must contain enough bytes for simd_float3"));

  }
  DWORD2(v12) = 0;
  *(_QWORD *)&v12 = 0;
  objc_msgSend(v7, "getBytes:length:", &v12, 16);
  v11 = v12;

  return (__n128)v11;
}

- (void)encodeQuat:(uint64_t)a3 forKey:(void *)a4
{
  id v5;
  void *v6;
  __n128 v7;

  v7 = a2;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 16));
  objc_msgSend(a1, "encodeObject:forKey:", v6, v5, *(_OWORD *)&v7);

}

- (__n128)decodeQuatForKey:(void *)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  if ((unint64_t)objc_msgSend(v7, "length") <= 0xF)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "simd_quatf GetQuaternionFromNSData(NSData *__strong)"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NINearbyObject.mm"), 670, CFSTR("NSData must contain enough bytes for simd_quatf"));

  }
  objc_msgSend(v7, "getBytes:length:", &v12, 16);

  v11 = v12;
  return (__n128)v11;
}

@end
