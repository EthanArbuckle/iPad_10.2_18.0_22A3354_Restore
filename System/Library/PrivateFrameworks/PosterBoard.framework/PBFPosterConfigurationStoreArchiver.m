@implementation PBFPosterConfigurationStoreArchiver

+ (int64_t)minSupportedArchiveVersion
{
  return 1;
}

+ (id)archiveConfigurationStoreWithCoordinator:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  PBFPosterConfigurationStoreArchiveManifest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  int v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identityOfLatestVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBFPosterConfigurationStoreArchiveManifest initWithConfigurationStoreCoordinator:]([PBFPosterConfigurationStoreArchiveManifest alloc], "initWithConfigurationStoreCoordinator:", v4);
  objc_msgSend(v4, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterConfigurationStoreArchiveManifest buildVersion](v7, "buildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%@-%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  PFTemporaryDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("PosterConfigurations"), 1);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15, "URLByAppendingPathComponent:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v17, "removeItemAtURL:error:", v16, 0);
  PFFileProtectionNoneAttributes();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  LOBYTE(v15) = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, v18, &v37);
  v19 = v37;

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v17, "removeItemAtURL:error:", v16, 0);
    v28 = a4;
LABEL_10:
    if (v19)
    {
      v38 = *MEMORY[0x1E0CB3388];
      v39[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PBFArchiverErrorDomain"), 2, v29);

    v27 = 0;
    goto LABEL_14;
  }
  v32 = v6;
  v36 = 0;
  -[PBFPosterConfigurationStoreArchiveManifest dataRepresentationWithError:](v7, "dataRepresentationWithError:", &v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v36;

  if (!v20)
  {
LABEL_7:
    v27 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_manifestURLInContainerURL:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v21;
  v23 = objc_msgSend(v20, "writeToURL:options:error:", v22, 0, &v35);
  v24 = v35;

  if (v23)
  {
    objc_msgSend(v4, "identifierURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("configuration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v24;
    v31 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v25, v26, &v34);
    v21 = v34;

    if (v31)
    {
      objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("aa"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      PBFAppleArchiveCompressDirectory(v16, v27);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v27 = 0;
  v21 = v24;
LABEL_9:
  v28 = a4;

  objc_msgSend(v17, "removeItemAtURL:error:", v16, 0);
  v19 = v21;
  v6 = v32;
  if (!v27)
    goto LABEL_10;
LABEL_14:
  if (v28)
    *v28 = objc_retainAutorelease(v21);

  return v27;
}

+ (id)unarchiveConfigurationStoreArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveAtURL_manifest_error___block_invoke;
  v12[3] = &unk_1E86F6268;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "_unarchiveWithHandler:manifest:error:", v12, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __94__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveAtURL_manifest_error___block_invoke(uint64_t a1, void *a2)
{
  return PBFAppleArchiveDecompress(*(void **)(a1 + 32), a2);
}

+ (id)unarchiveConfigurationStoreArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *Serial;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileHandleForWriting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileHandleForReading");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Serial = BSDispatchQueueCreateSerial();
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke;
  block[3] = &unk_1E86F2540;
  v22 = v10;
  v23 = v8;
  v14 = v8;
  v15 = v10;
  dispatch_async(Serial, block);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke_2;
  v19[3] = &unk_1E86F6268;
  v20 = v11;
  v16 = v11;
  objc_msgSend(a1, "_unarchiveWithHandler:manifest:error:", v19, a4, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "closeFile");

  return v17;
}

uint64_t __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "writeData:error:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "closeFile");
}

BOOL __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  AAByteStream_impl *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = AAFileStreamOpenWithFD(objc_msgSend(v2, "fileDescriptor"), 0);
  v5 = PBFAppleArchiveDecompressStream(v4, v3);

  return v5;
}

+ (id)_unarchiveWithHandler:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  uint64_t (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  PBFPosterConfigurationStoreArchiveManifest *v22;
  PBFPosterConfigurationStoreArchiveManifest *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t (**v61)(id, void *);
  PBFPosterConfigurationStoreArchiveManifest *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a3;
  v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v8 = (void *)MEMORY[0x1E0C99E98];
  PFTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("PosterConfigurations"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeItemAtURL:error:", v14, 0);
  PFFileProtectionNoneAttributes();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  LODWORD(v10) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, v15, &v77);
  v16 = v77;

  if (!(_DWORD)v10)
  {
    v30 = 0;
    v31 = a5;
    v19 = v70;
    goto LABEL_12;
  }
  if ((v6[2](v6, v14) & 1) != 0)
  {
    objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("configuration"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_manifestURLInContainerURL:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v70;
    v67 = (void *)v17;
    objc_msgSend(v70, "addObject:", v17);
    objc_msgSend(v70, "addObject:", v18);
    v76 = v16;
    v66 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v18, 0, &v76);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v76;

    v65 = (void *)v20;
    v22 = -[PBFPosterConfigurationStoreArchiveManifest initWithDataRepresentation:]([PBFPosterConfigurationStoreArchiveManifest alloc], "initWithDataRepresentation:", v20);
    v23 = v22;
    if (v22)
    {
      v63 = v21;
      v24 = -[PBFPosterConfigurationStoreArchiveManifest archiveVersion](v22, "archiveVersion");
      if (v24 >= objc_msgSend(a1, "minSupportedArchiveVersion"))
      {
        v61 = v6;
        -[PBFPosterConfigurationStoreArchiveManifest extensionIdentifier](v23, "extensionIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", v39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = (void *)MEMORY[0x1E0C99E98];
        v62 = v23;
        -[PBFPosterConfigurationStoreArchiveManifest configurationUUID](v23, "configurationUUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", v26, 3, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "URLByDeletingLastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        PFFileProtectionNoneAttributes();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v63;
        v45 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v43, 1, v44, &v75);
        v16 = v75;

        if (v45)
        {
          v74 = v16;
          v64 = v42;
          v46 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v67, v42, &v74);
          v47 = v74;

          if (v46)
          {
            objc_msgSend(v26, "URLByAppendingPathComponent:", CFSTR("/"));
            v59 = v47;
            v48 = objc_claimAutoreleasedReturnValue();

            v23 = v62;
            -[PBFPosterConfigurationStoreArchiveManifest configurationUUID](v62, "configurationUUID");
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)MEMORY[0x1E0D7F8E0];
            -[PBFPosterConfigurationStoreArchiveManifest extensionIdentifier](v62, "extensionIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D7FB50], "loadPosterDescriptorIdentifierForPathAtURL:type:posterUUID:", v48, 3, v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBFPosterConfigurationStoreArchiveManifest role](v62, "role");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)v49;
            objc_msgSend(v50, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v51, v52, v53, v49, -[PBFPosterConfigurationStoreArchiveManifest latestConfigurationVersion](v62, "latestConfigurationVersion"), -[PBFPosterConfigurationStoreArchiveManifest latestConfigurationSupplement](v62, "latestConfigurationSupplement"));
            v54 = objc_claimAutoreleasedReturnValue();

            v60 = (void *)v48;
            objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v48, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0;
            objc_msgSend(MEMORY[0x1E0D7FB50], "loadConfiguredPropertiesForPath:error:", v55, &v73);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v73;

            if (v56)
            {
              v57 = (void *)v54;
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA60]), "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v55, 0, v54, v56, 0);
              v29 = v64;
              if (a4)
                *a4 = objc_retainAutorelease(v62);
              v31 = a5;
            }
            else
            {
              v57 = (void *)v54;
              v30 = 0;
              v31 = a5;
              v29 = v64;
            }

            v26 = v60;
            v6 = v61;
            v19 = v70;
          }
          else
          {
            v30 = 0;
            v16 = v47;
            v23 = v62;
            v31 = a5;
            v19 = v70;
            v29 = v64;
          }
        }
        else
        {
          v30 = 0;
          v31 = a5;
          v19 = v70;
          v29 = v42;
          v23 = v62;
        }
        goto LABEL_10;
      }
      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v80 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Archive version %lu is older than min supported %lu"), -[PBFPosterConfigurationStoreArchiveManifest archiveVersion](v23, "archiveVersion"), objc_msgSend(a1, "minSupportedArchiveVersion"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v25;
      v29 = (void *)v27;
      v16 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", CFSTR("PBFArchiverErrorDomain"), 5, v27);

    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v82 = *MEMORY[0x1E0CB2D50];
      v83[0] = CFSTR("Archive is unsupported");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("PBFArchiverErrorDomain"), 4, v26);
      v29 = v21;
    }
    v30 = 0;
    v31 = a5;
LABEL_10:

    v33 = v67;
    goto LABEL_11;
  }
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PBFArchiverErrorDomain"), 3, 0);
  v30 = 0;
  v33 = v16;
  v16 = (id)v32;
  v31 = a5;
  v19 = v70;
LABEL_11:

LABEL_12:
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __76__PBFPosterConfigurationStoreArchiver__unarchiveWithHandler_manifest_error___block_invoke;
  v71[3] = &unk_1E86F6290;
  v35 = v7;
  v72 = v35;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v71);
  if (!v30)
  {
    if (v16)
    {
      v78 = *MEMORY[0x1E0CB3388];
      v79 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PBFArchiverErrorDomain"), 3, v36);

    v16 = (id)v37;
  }
  if (v31)
    *v31 = objc_retainAutorelease(v16);

  return v30;
}

uint64_t __76__PBFPosterConfigurationStoreArchiver__unarchiveWithHandler_manifest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a2, 0);
}

@end
