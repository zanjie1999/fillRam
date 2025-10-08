/*
 * 跨平台内存填充器
 * zyyme 20251008
 */

package main

import (
	"fmt"
)

// 块大小10MB
const chunkSize = 10 << 20

func main() {
	var memoryChunks [][]byte
	chunkCount := 0
	mb := 0
	for {
		chunk := make([]byte, chunkSize)
		// 假设页面大小为 4096 字节 (4KB)，只写入每页的第一个字节，确保实际占用而不是已分配
		for i := 0; i < chunkSize; i += 4096 {
			chunk[i] = 0
		}
		memoryChunks = append(memoryChunks, chunk)
		chunkCount++
		mb = chunkCount * chunkSize >> 20
		if mb%100 == 0 {
			fmt.Printf("%.1f GB\n", float64(mb)/1000)
		}
		// 给系统反应一下
		// time.Sleep(1 * time.Millisecond)
	}
}
