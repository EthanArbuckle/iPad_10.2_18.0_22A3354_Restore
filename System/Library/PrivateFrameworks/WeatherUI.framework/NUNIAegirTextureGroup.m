@implementation NUNIAegirTextureGroup

- (void)preloadTexturesForSpheroids:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v8), "type");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_albedos, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        -[NSArray objectAtIndexedSubscript:](self->_normals, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v12);

        -[NSArray objectAtIndexedSubscript:](self->_emissives, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        -[NSArray objectAtIndexedSubscript:](self->_cloudsLo, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

        -[NSArray objectAtIndexedSubscript:](self->_cloudsMd, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

        -[NSArray objectAtIndexedSubscript:](self->_cloudsHi, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        -[NSArray objectAtIndexedSubscript:](self->_gradients, "objectAtIndexedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        objc_msgSend(v10, "addObject:", self->_starfield);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = v10;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v25;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v22), "atlas");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "prewarm");

              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v20);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

}

- (NSArray)albedos
{
  return self->_albedos;
}

- (void)setAlbedos:(id)a3
{
  objc_storeStrong((id *)&self->_albedos, a3);
}

- (NSArray)normals
{
  return self->_normals;
}

- (void)setNormals:(id)a3
{
  objc_storeStrong((id *)&self->_normals, a3);
}

- (NSArray)emissives
{
  return self->_emissives;
}

- (void)setEmissives:(id)a3
{
  objc_storeStrong((id *)&self->_emissives, a3);
}

- (NSArray)cloudsLo
{
  return self->_cloudsLo;
}

- (void)setCloudsLo:(id)a3
{
  objc_storeStrong((id *)&self->_cloudsLo, a3);
}

- (NSArray)cloudsMd
{
  return self->_cloudsMd;
}

- (void)setCloudsMd:(id)a3
{
  objc_storeStrong((id *)&self->_cloudsMd, a3);
}

- (NSArray)cloudsHi
{
  return self->_cloudsHi;
}

- (void)setCloudsHi:(id)a3
{
  objc_storeStrong((id *)&self->_cloudsHi, a3);
}

- (NSArray)gradients
{
  return self->_gradients;
}

- (void)setGradients:(id)a3
{
  objc_storeStrong((id *)&self->_gradients, a3);
}

- (CLKUITexture)starfield
{
  return self->_starfield;
}

- (void)setStarfield:(id)a3
{
  objc_storeStrong((id *)&self->_starfield, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starfield, 0);
  objc_storeStrong((id *)&self->_gradients, 0);
  objc_storeStrong((id *)&self->_cloudsHi, 0);
  objc_storeStrong((id *)&self->_cloudsMd, 0);
  objc_storeStrong((id *)&self->_cloudsLo, 0);
  objc_storeStrong((id *)&self->_emissives, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_albedos, 0);
}

@end
