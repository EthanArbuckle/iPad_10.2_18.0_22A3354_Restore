@implementation VisionCoreEspressoUtils

+ (id)tensorShapesForBlobNames:(id)a3 ofNetworkModelFileURL:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  std::string::size_type size;
  std::string *v16;
  std::string *v17;
  std::string *v18;
  std::string *v19;
  uint64_t v20;
  int v21;
  int v22;
  char v23;
  uint64_t v24;
  int64_t v25;
  uint64_t i;
  uint64_t v27;
  __int128 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char **v33;
  char *v34;
  __int128 v35;
  char *v36;
  void *v37;
  void *v39;
  id v40;
  id v41;
  _OWORD v42[2];
  uint64_t v43;
  void *__p[2];
  char v45;
  char v46[8];
  char *v47;
  uint64_t v48;
  char *v49;
  std::string v50;
  _QWORD v51[2];
  uint64_t v52;
  _QWORD v53[21];

  v53[19] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v40 = a4;
  objc_msgSend(v40, "VisionCoreFileSystemPathAndReturnError:", a5);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v8 = objc_msgSend(v7, "count");
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 40 * v8);
    v9 = objc_msgSend(v39, "mutableBytes");
    v10 = v9;
    if (v8)
    {
      v11 = 0;
      v12 = (_QWORD *)v9;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *v12 = objc_msgSend(v13, "UTF8String");
        v12 += 5;

        ++v11;
      }
      while (v8 != v11);
    }
    v14 = objc_retainAutorelease(v41);
    std::string::basic_string[abi:ne180100]<0>(&v50, (char *)objc_msgSend(v14, "UTF8String"));
    size = HIBYTE(v50.__r_.__value_.__r.__words[2]);
    v16 = (std::string *)v50.__r_.__value_.__r.__words[0];
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v50.__r_.__value_.__l.__size_;
    else
      v16 = &v50;
    if (size)
    {
      v17 = (std::string *)((char *)v16 + size);
      v18 = v16;
      v19 = v17;
      do
      {
        if (v18->__r_.__value_.__s.__data_[0] == 46)
        {
          v20 = 1u;
          while (v20 != 13)
          {
            if ((std::string *)((char *)v18 + v20) == v17)
              goto LABEL_19;
            v21 = v18->__r_.__value_.__s.__data_[v20];
            v22 = aEspressoNet[v20++];
            if (v21 != v22)
              goto LABEL_11;
          }
          v19 = v18;
        }
LABEL_11:
        v18 = (std::string *)((char *)v18 + 1);
      }
      while (v18 != v17);
LABEL_19:
      v23 = 0;
      v24 = 4294967290;
      if (v19 != v17)
      {
        v25 = (char *)v19 - (char *)v16;
        if (v25 != -1)
        {
          std::string::replace(&v50, v25 + 10, 0xFFFFFFFFFFFFFFFFLL, "shape", 5uLL);
          std::ifstream::basic_ifstream(v51);
          std::string::basic_string[abi:ne180100]<0>(__p, "json");
          Espresso::load_network_shape();
          if (v45 < 0)
          {
            operator delete(__p[0]);
            if (!v8)
              goto LABEL_40;
          }
          else if (!v8)
          {
            goto LABEL_40;
          }
          v31 = v10;
          v32 = v8;
          do
          {
            *(_OWORD *)(v31 + 24) = 0u;
            *(_OWORD *)(v31 + 8) = 0u;
            std::string::basic_string[abi:ne180100]<0>(__p, *(char **)v31);
            v33 = (char **)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)v46, __p);
            if (&v47 != v33
              || (v33 = (char **)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)&v48, __p), &v49 != v33))
            {
              v34 = v33[7];
              *(_QWORD *)&v35 = (int)v34;
              *((_QWORD *)&v35 + 1) = SHIDWORD(v34);
              *(_OWORD *)(v31 + 8) = v35;
              v36 = v33[8];
              *(_QWORD *)&v35 = (int)v36;
              *((_QWORD *)&v35 + 1) = SHIDWORD(v36);
              *(_OWORD *)(v31 + 24) = v35;
            }
            if (v45 < 0)
              operator delete(__p[0]);
            v31 += 40;
            --v32;
          }
          while (v32);
LABEL_40:
          std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v49);
          std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v47);
          v51[0] = *MEMORY[0x24BEDB7E0];
          *(_QWORD *)((char *)v51 + *(_QWORD *)(v51[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
          MEMORY[0x2207A5F6C](&v52);
          std::istream::~istream();
          MEMORY[0x2207A5FB4](v53);
          v24 = 0;
          v23 = 1;
          if ((*((_BYTE *)&v50.__r_.__value_.__s + 23) & 0x80) != 0)
          {
LABEL_41:
            operator delete(v50.__r_.__value_.__l.__data_);
            if ((v23 & 1) == 0)
            {
LABEL_42:
              if (a5)
              {
                v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("unable to introspect %@"), v14);
                objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForEspressoReturnStatus:localizedDescription:", v24, v37);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

                a5 = 0;
              }
LABEL_44:

              goto LABEL_45;
            }
LABEL_28:
            a5 = (id *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v8);
            if (v8)
            {
              for (i = 0; i != v8; ++i)
              {
                v27 = *(_QWORD *)(v10 + 32);
                v28 = *(_OWORD *)(v10 + 16);
                v42[0] = *(_OWORD *)v10;
                v42[1] = v28;
                v43 = v27;
                +[VisionCoreEspressoTensorShape shapeForBlobDimensions:](VisionCoreEspressoTensorShape, "shapeForBlobDimensions:", v42);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectAtIndexedSubscript:", i);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a5, "setObject:forKey:", v29, v30);

                v10 += 40;
              }
            }
            goto LABEL_44;
          }
LABEL_27:
          if ((v23 & 1) == 0)
            goto LABEL_42;
          goto LABEL_28;
        }
      }
    }
    else
    {
      v23 = 0;
      v24 = 4294967290;
    }
    if ((*((_BYTE *)&v50.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_41;
    goto LABEL_27;
  }
  a5 = 0;
LABEL_45:

  return a5;
}

+ (BOOL)getInputImageTensorDescriptor:(id *)a3 outputTensorDescriptors:(id *)a4 forNetworkModelFileURL:(id)a5 inputBlobName:(id)a6 pixelFormatType:(unsigned int)a7 outputBlobNamesWithTypes:(id)a8 confidencesBlobNamesWithLabelsFiles:(id)a9 error:(id *)a10
{
  uint64_t v11;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  NSString *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  VisionCoreLabeledConfidencesDescriptor *v36;
  BOOL v37;
  void *v38;
  NSURL *v40;
  id obj;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  NSURL *v48;
  void *v49;
  id v50;
  NSString *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t v59;

  v11 = *(_QWORD *)&a7;
  v59 = *MEMORY[0x24BDAC8D0];
  v48 = (NSURL *)a5;
  v51 = (NSString *)a6;
  v15 = a8;
  v50 = a9;
  v44 = v15;
  v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v15, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v16, "initWithArray:", v17);

  if (v51)
    objc_msgSend(v49, "addObject:", v51);
  if (v50)
  {
    objc_msgSend(v50, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObjectsFromArray:", v18);

  }
  objc_msgSend(a1, "tensorShapesForBlobNames:ofNetworkModelFileURL:error:", v49, v48, a10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v19;
  if (!v19)
    goto LABEL_28;
  if (!v51)
  {
    *a3 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (a10)
    {
      _noBlobInNetworkModelError(v48, v51);
      v37 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_28:
    v37 = 0;
    goto LABEL_37;
  }
  *a3 = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:]([VisionCoreImageTensorDescriptor alloc], "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v51, v11, objc_msgSend(v20, "width"), objc_msgSend(v20, "height"));

LABEL_10:
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = v15;
  v23 = v43;
  objc_opt_self();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __83__VisionCoreEspressoUtils__addNewTensorDescriptorsTo_forBlobNamesWithTypes_shapes___block_invoke;
  v56[3] = &unk_24E1DB808;
  v24 = v23;
  v57 = v24;
  v25 = v21;
  v58 = v25;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v56);

  if (!v50)
    goto LABEL_25;
  v45 = v25;
  v26 = v50;
  v47 = v24;
  v40 = v48;
  v46 = v26;
  objc_opt_self();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v26, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v27)
    goto LABEL_24;
  v28 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(_QWORD *)v53 != v28)
        objc_enumerationMutation(obj);
      v30 = *(NSString **)(*((_QWORD *)&v52 + 1) + 8 * i);
      objc_msgSend(v47, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        if (a10)
        {
          _noBlobInNetworkModelError(v40, v30);
          *a10 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_35;
      }
      objc_msgSend(v46, "objectForKeyedSubscript:", v30);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_opt_self();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = v32;
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a10)
        {
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("cannot resolve %@ into a file URL"), v32);
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v38);
          *a10 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_34:

LABEL_35:
        v37 = 0;
        goto LABEL_36;
      }
      objc_msgSend(v33, "URLForResourceFileNamed:error:", v32, a10);
      v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      v35 = v34;

      if (!v35)
        goto LABEL_34;
      v36 = -[VisionCoreLabeledConfidencesDescriptor initWithName:dataType:shape:strides:labelsFileURL:]([VisionCoreLabeledConfidencesDescriptor alloc], "initWithName:dataType:shape:strides:labelsFileURL:", v30, 65568, v31, 0, v35);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v36, v30);

    }
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v27)
      continue;
    break;
  }
LABEL_24:

LABEL_25:
  *a4 = objc_retainAutorelease(v25);
  v37 = 1;
LABEL_36:

LABEL_37:
  return v37;
}

void __83__VisionCoreEspressoUtils__addNewTensorDescriptorsTo_forBlobNamesWithTypes_shapes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  VisionCoreImageTensorDescriptor *v8;
  uint64_t v9;
  VisionCoreTensorDescriptor *v10;
  VisionCoreTensorDescriptor *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "asVisionCoreTensorDataType");
  if ((unint64_t)(v7 - 983048) <= 0x18 && ((1 << (v7 - 8)) & 0x1000101) != 0)
  {
    v8 = [VisionCoreImageTensorDescriptor alloc];
    switch(v7)
    {
      case 983048:
        v9 = 8;
        break;
      case 983072:
        v9 = 1278226534;
        break;
      case 983056:
        v9 = 1278226536;
        break;
      default:
        v9 = 0;
        break;
    }
    v10 = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:](v8, "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v12, v9, objc_msgSend(v6, "width"), objc_msgSend(v6, "height"));
  }
  else
  {
    v10 = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:]([VisionCoreTensorDescriptor alloc], "initWithName:dataType:shape:strides:", v12, v7, v6, 0);
  }
  v11 = v10;
  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v12);

}

+ (id)URLForResourceFileNamed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend(v5, "isAbsolutePath"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VisionCoreFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "URLForResource:withExtension:", v5, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v9)
      {
        v10 = v9;
      }
      else if (a4)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Could not locate resource named \"%@\"), v5);
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", CFSTR("could not locate VisionCore.framework"));
      v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (id)URLForModelNamed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  VisionCoreFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v5, "hasSuffix:", CFSTR(".espresso.net")))
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("net"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a4)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Could not locate model named \"%@\"), v5);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", CFSTR("could not locate VisionCore.framework"));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
