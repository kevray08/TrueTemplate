c o n s t   h t t p   =   r e q u i r e ( ' h t t p ' ) ;  
  
 c o n s t   h o s t n a m e   =   ' 1 2 7 . 0 . 0 . 1 ' ;  
 c o n s t   p o r t   =   3 0 0 0 ;  
  
 c o n s t   s e r v e r   =   h t t p . c r e a t e S e r v e r ( ( r e q ,   r e s )   = >   {  
     r e s . s t a t u s C o d e   =   2 0 0 ;  
     r e s . s e t H e a d e r ( ' C o n t e n t - T y p e ' ,   ' t e x t / p l a i n ' ) ;  
     r e s . e n d ( ' H e l l o   W o r l d \ n ' ) ;  
 } ) ;  
  
 s e r v e r . l i s t e n ( p o r t ,   h o s t n a m e ,   ( )   = >   {  
     c o n s o l e . l o g ( ` S e r v e r   r u n n i n g   a t   h t t p : / / $ { h o s t n a m e } : $ { p o r t } / ` ) ;  
 } ) ;  
 