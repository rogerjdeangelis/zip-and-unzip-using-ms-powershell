zip and unzip using ms powershell                                                                             
                                                                                                              
github                                                                                                        
https://github.com/rogerjdeangelis/zip-and-unzip-using-ms-powershell                                          
                                                                                                              
see for other zip repos                                                                                       
https://github.com/rogerjdeangelis?tab=repositories&q=+zip+&type=&language=                                   
                                                                                                              
* R and python are Probably better, because they are truly cross platform                                     
  with many options. Powershell is supposed to be cross platform?                                             
  R and python are equally simple;                                                                            
                                                                                                              
                                                                                                              
%let pth=%sysfunc(pathname(work));                                                                            
%put &=pth;                                                                                                   
                                                                                                              
*_                   _                                                                                        
(_)_ __  _ __  _   _| |_                                                                                      
| | '_ \| '_ \| | | | __|                                                                                     
| | | | | |_) | |_| | |_                                                                                      
|_|_| |_| .__/ \__,_|\__|                                                                                     
        |_|                                                                                                   
;                                                                                                             
                                                                                                              
data _null_;                                                                                                  
    length newdir $132;                                                                                       
    newdir=dcreate("temp","&pth");                                                                            
    newdir=dcreate("zip","&pth");                                                                             
    newdir=dcreate("unzip","&pth");                                                                           
run;quit;                                                                                                     
                                                                                                              
* create two files in &pth/temp;                                                                              
data _null_;                                                                                                  
  file "&pth/temp/temp1.txt";                                                                                 
  put 'temp1';                                                                                                
  file "&pth/temp/temp2.txt";                                                                                 
  put 'temp2';                                                                                                
run;quit;                                                                                                     
                                                                                                              
                                                                                                              
F:\WRK\xxxxxx\TEMP                                                                                            
    |                                                                                                         
     temp1.txt                                                                                                
     temp2.txt                                                                                                
                                                                                                              
*            _               _                                                                                
  ___  _   _| |_ _ __  _   _| |_                                                                              
 / _ \| | | | __| '_ \| | | | __|                                                                             
| (_) | |_| | |_| |_) | |_| | |_                                                                              
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                             
                |_|                                                                                           
;                                                                                                             
                                                                                                              
* this copies the tree to the clipboard;                                                                      
x 'tree "f:\wrk\_TD11152_T7610_\unzip" /F /A | clip';                                                         
                                                                                                              
F:\WRK\xxxxxxx\ZIP    ** zip archive                                                                          
    |                                                                                                         
    temp.zip                                                                                                  
                                                                                                              
                                                                                                              
F:\WRK\xxxxxxx\UNZIP                                                                                          
                                                                                                              
\---temp             ** unzip files (not an archive exactly equal to input);                                  
      |                                                                                                       
       temp1.txt                                                                                              
       temp2.txt                                                                                              
                                                                                                              
*                                                                                                             
 _ __  _ __ ___   ___ ___  ___ ___                                                                            
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                           
| |_) | | | (_) | (_|  __/\__ \__ \                                                                           
| .__/|_|  \___/ \___\___||___/___/                                                                           
|_|                                                                                                           
;                                                                                                             
                                                                                                              
%utlfkil(&pth\zip\temp.zip);                                                                                  
                                                                                                              
options xsyc xwait; * change (noxwait nosync) for production but this allows us to view problems;             
                                                                                                              
* COMPRESS;                                                                                                   
%sysexec(powershell Compress-Archive -Path &pth\temp -DestinationPath &pth\zip\temp.zip);                     
                                                                                                              
                                                                                                              
* EXPAND;                                                                                                     
%sysexec(powershell expand-archive -path &pth\zip\temp.zip -Force -destinationpath &pth\unzip);               
                                                                                                              
                                                                                                              
                                                                                                              
