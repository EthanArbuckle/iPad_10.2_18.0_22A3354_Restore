@implementation ASPStorageiBootUpdater

+ (id)IOMatchingPropertyTable
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("IOProviderClass");
  v4 = CFSTR("ASPStorage");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

- (ASPStorageiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3;
  ASPStorageiBootUpdater *v4;
  DevNodeWriter *v5;
  BOOL v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)ASPStorageiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v8, "initWithIOService:");
  if (v4)
  {
    v4->_llbWriter = -[DevNodeWriter initWithServiceNamed:parent:]([DevNodeWriter alloc], "initWithServiceNamed:parent:", CFSTR("EmbeddedDeviceTypeLLBFirmware"), v3);
    v5 = -[DevNodeWriter initWithServiceNamed:parent:]([DevNodeWriter alloc], "initWithServiceNamed:parent:", CFSTR("EmbeddedDeviceTypeFirmware"), v3);
    v4->_firmwareWriter = v5;
    if (v4->_llbWriter)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  DevNodeWriter *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  DevNodeWriter *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSError *v52;
  NSError *v53;
  BOOL result;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSArray *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSData *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  size_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  DevNodeWriter *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint64_t v155;
  int v156;
  __int16 v157;
  _BYTE v158[128];
  _BYTE v159[128];

  v157 = 0;
  v156 = 1;
  v155 = 0;
  if (!-[DevNodeWriter isAvailable](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "isAvailable"))
  {
    v37 = -[ASPStorageiBootUpdater llbWriter](self, "llbWriter");
    iBU_LOG_real((uint64_t)CFSTR("LLB writer %@ was unavailable at write-time"), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v38, v39, v40, v41, v42, v43, (uint64_t)v37);
    if (a3)
    {
      v142 = -[ASPStorageiBootUpdater llbWriter](self, "llbWriter");
      v36 = CFSTR("LLB writer %@ was unavailable at write-time");
LABEL_18:
      v51 = 6;
      v35 = 0;
LABEL_22:
      v52 = MSUBootFirmwareError(v51, v35, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v142);
LABEL_23:
      v53 = v52;
      result = 0;
      *a3 = v53;
      return result;
    }
    return 0;
  }
  if (!-[DevNodeWriter isAvailable](-[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), "isAvailable"))
  {
    v44 = -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter");
    iBU_LOG_real((uint64_t)CFSTR("Firmware writer %@ was unavailable at write-time"), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v45, v46, v47, v48, v49, v50, (uint64_t)v44);
    if (a3)
    {
      v142 = -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter");
      v36 = CFSTR("Firmware writer %@ was unavailable at write-time");
      goto LABEL_18;
    }
    return 0;
  }
  v5 = -[NSArray count](-[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages"), "count");
  iBU_LOG_real((uint64_t)CFSTR("Writing %lu firmware images to firmware dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v6, v7, v8, v9, v10, v11, v5);
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v12 = -[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages");
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v151, v159, 16);
  if (v13)
  {
    v20 = v13;
    v21 = *(_QWORD *)v152;
LABEL_5:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v152 != v21)
        objc_enumerationMutation(v12);
      v23 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * v22);
      iBU_LOG_real((uint64_t)CFSTR("Writing a firmware image to firmware dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v14, v15, v16, v17, v18, v19, v140);
      if (-[MSUBootFirmwareUpdater _encodeAndWriteFirmware:toWriter:withError:](self, "_encodeAndWriteFirmware:toWriter:withError:", v23, -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), &v155))
      {
        break;
      }
      if (v20 == (id)++v22)
      {
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v151, v159, 16);
        if (v20)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    iBU_LOG_real((uint64_t)CFSTR("Failed to write FW data to firmwareWriter"), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v14, v15, v16, v17, v18, v19, v140);
    if (!a3)
      return 0;
    v35 = v155;
    v36 = CFSTR("Failed to write FW data to firmwareWriter");
    goto LABEL_21;
  }
LABEL_11:
  iBU_LOG_real((uint64_t)CFSTR("Writing end_of_contents_bytes to firmware dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v14, v15, v16, v17, v18, v19, v140);
  if (-[DevNodeWriter writeData:withError:](-[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), "writeData:withError:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v157, 2), &v155))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to write end-of-contents bytes to firmwareWriter."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v24, v25, v26, v27, v28, v29, v141);
    if (a3)
    {
      v35 = v155;
      v36 = CFSTR("Failed to write end-of-contents bytes to firmwareWriter.");
LABEL_21:
      v51 = 3;
      goto LABEL_22;
    }
    return 0;
  }
  if (!-[DevNodeWriter finished](-[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), "finished"))
    iBU_LOG_real((uint64_t)CFSTR("Failed to clean up firmwareWriter."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v55, v56, v57, v58, v59, v60, v141);
  if (sysctlbyname("debug.ASPFW", 0, 0, &v156, 4uLL))
    goto LABEL_27;
  v75 = -[NSArray count](-[MSUBootFirmwareUpdater bootBlockImages](self, "bootBlockImages"), "count");
  iBU_LOG_real((uint64_t)CFSTR("Writing %lu firmware images to llb dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v76, v77, v78, v79, v80, v81, v75);
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v82 = -[MSUBootFirmwareUpdater bootBlockImages](self, "bootBlockImages");
  v83 = -[NSArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v147, v158, 16);
  if (v83)
  {
    v90 = v83;
    v91 = 0;
    v92 = *(_QWORD *)v148;
LABEL_31:
    v93 = 0;
    while (1)
    {
      if (*(_QWORD *)v148 != v92)
        objc_enumerationMutation(v82);
      v94 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v93), -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary"));
      if (!v94)
        break;
      v101 = v94;
      if (-[DevNodeWriter writeData:withError:](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "writeData:withError:", v94, &v155))
      {
        iBU_LOG_real((uint64_t)CFSTR("Failed to write boot block data to dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v102, v103, v104, v105, v106, v107, v143);
        if (a3)
          *a3 = MSUBootFirmwareError(3, v155, (uint64_t)CFSTR("Failed to write boot block data to dev node."), v115, v116, v117, v118, v119, v145);

        return 0;
      }
      v91 += (unsigned __int16)objc_msgSend(v101, "length");

      if (v90 == (id)++v93)
      {
        v90 = -[NSArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v147, v158, 16);
        if (v90)
          goto LABEL_31;
        goto LABEL_40;
      }
    }
    iBU_LOG_real((uint64_t)CFSTR("Got NULL data while wrapping boot-block IMG4 data."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v95, v96, v97, v98, v99, v100, v143);
    if (!a3)
      return 0;
    v35 = v155;
    v36 = CFSTR("Got NULL data while wrapping boot-block IMG4 data.");
    goto LABEL_21;
  }
  v91 = 0;
LABEL_40:
  iBU_LOG_real((uint64_t)CFSTR("Writing end_of_contents_bytes to lldb dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v84, v85, v86, v87, v88, v89, v143);
  v108 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v157, 2);
  if (-[DevNodeWriter writeData:withError:](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "writeData:withError:", v108, &v155))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to write end-of-contents bytes to llbWriter."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v109, v110, v111, v112, v113, v114, v144);
    if (a3)
    {
      v35 = v155;
      v36 = CFSTR("Failed to write end-of-contents bytes to llbWriter.");
      goto LABEL_21;
    }
    return 0;
  }
  v120 = 4096 - (((unsigned __int16)-[NSData length](v108, "length") + v91) & 0xFFF);
  v121 = malloc(v120);
  bzero(v121, v120);
  iBU_LOG_real((uint64_t)CFSTR("Writing final padding to llb dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v122, v123, v124, v125, v126, v127, v144);
  if (-[DevNodeWriter writeBytes:ofLength:withError:](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "writeBytes:ofLength:withError:", v121, v120, &v155))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to write LLB to dev node."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v128, v129, v130, v131, v132, v133, v146);
    if (a3)
    {
      v35 = v155;
      v36 = CFSTR("Failed to write LLB to dev node.");
      goto LABEL_21;
    }
    return 0;
  }
  if (!-[DevNodeWriter finished](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "finished"))
    iBU_LOG_real((uint64_t)CFSTR("Failed to clean up llbWriter."), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v134, v135, v136, v137, v138, v139, v146);
  if (sysctlbyname("debug.ASPLLB", 0, 0, &v156, 4uLL))
  {
LABEL_27:
    v61 = __error();
    strerror(*v61);
    iBU_LOG_real((uint64_t)CFSTR("sysctlbyname('%s') failed with error: %s"), "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]", v62, v63, v64, v65, v66, v67, (uint64_t)"debug.ASPFW");
    if (a3)
    {
      v68 = v155;
      v69 = __error();
      strerror(*v69);
      v52 = MSUBootFirmwareError(1, v68, (uint64_t)CFSTR("sysctlbyname('%s') failed with error: %s"), v70, v71, v72, v73, v74, (uint64_t)"debug.ASPFW");
      goto LABEL_23;
    }
    return 0;
  }
  return 1;
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  return -[ASPStorageiBootUpdater updateBootFirmwareWithError:](self, "updateBootFirmwareWithError:", a5, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASPStorageiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (DevNodeWriter)llbWriter
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 88, 1);
}

- (DevNodeWriter)firmwareWriter
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 96, 1);
}

@end
